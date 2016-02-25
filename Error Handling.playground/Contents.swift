//: Playground - noun: a place where people can play

import UIKit


// Domain Errors
// Incorrect input and unexistance data
Int.init("2") // Failable initializer - Optional
Int.init("test") // nil



// Compiler Error
//  - Domain Error


// Runtime Error
//  - Recorable Error
//  - Unrecorable Error
// - Logical error - from the user
// - Universal error


struct Friend {
    let name: String
    let age: String
    let address: String?
}



// gaurd avoids us to get stuck in pyramid of doom
func createFriendFromJson(dict: [String: String]) -> Friend? {
    guard let name = dict["name"], age = dict["age"] else {
        return nil
    }
    
    let address = dict["address"]
    
    return Friend(name: name, age: age, address: address)
}


// Enum are well suited to represent errors.
enum FriendError: ErrorType {
    case InvalidData(String) // assosiated value to enums
    case NetworkError(String)
}

// gaurd avoids us to get stuck in pyramid of doom
// we can't return Optional anymore
func createFriendFromJson2(dict: [String: String]) throws -> Friend {
    guard let name = dict["name"] else {
        throw FriendError.InvalidData("Name key failed")
    }
    
    guard let age = dict["age"] else {
        throw FriendError.InvalidData("Age key failed")
    }
    
    
    let address = dict["address"]
    
    return Friend(name: name, age: age, address: address)
}

// use try to call a function that throws an error 


let response = ["name": "Pasan", "age2": "27", "address": "someAddress"];

response.keys.contains("name") ? "yes" : "no"


func sendMessageToFriend(friend: Friend, message: String) {
    
}

do {
    let friend = try createFriendFromJson2(response)
    sendMessageToFriend(friend, message: "")
} catch FriendError.InvalidData(let key) {
    print(key)
} catch FriendError.NetworkError(let key) {
    print(key)
}


enum ParserError: ErrorType {
    case EmptyDictionary(String)
    case InvalidKey(String)
}

struct Parser {
    var data: [String : String?]?
    
    func parse() throws {
        guard let data = data else {
            throw ParserError.EmptyDictionary("empty")
        }
        
        if !data.keys.contains("someKey") {
            throw ParserError.InvalidKey("invalid")
        }
    }
}

let data: [String : String?]? = ["someKey": nil]
let parser = Parser(data: data)
do {
    try parser.parse()
} catch ParserError.EmptyDictionary(let key){
    print(key)
}  catch ParserError.InvalidKey(let key){
    print(key)
}


/*
enum ParserError: ErrorType {
    case EmptyDictionary
    case InvalidKey
}

struct Parser {
    var data: [String : String?]?
    
    func parse() throws {
        guard let data = data else {
            throw ParserError.EmptyDictionary
        }
        
        if !data.keys.contains("someKey") {
            throw ParserError.InvalidKey
        }
    }
}

let data: [String : String?]? = ["someKey": nil]
let parser = Parser(data: data)
do {
    
    try parser.parse()
    
} catch ParserError.EmptyDictionary {
    print("empty");
} catch ParserError.InvalidKey {
    print("invalid")
}

*/



// defer statement when you exit the scope and executes in reverse order
// defer statements execute bottom to top in the current scope

// Automatic Propagation
// Manual propagation of errors
// cocco code in IOS SDK

var error: NSError? = nil
// Error Domain
// Error Code
// User info dictionary
