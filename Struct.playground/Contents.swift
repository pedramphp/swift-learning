//: Playground - noun: a place where people can play

import UIKit

// Struct is a general purpose type to create custom data structures
// Create a new data type
// properties and methods
struct Contact {
    var firstName: String // stored properties
    let lastName: String // can't change the constant
}


// Automatic initializer
var person = Contact(firstName: "John", lastName: "Smith")
person.lastName
person.firstName

person.firstName = "Tom"



struct Contact2 {
    var firstName: String // stored properties
    let lastName: String // can't change the constant
    var type = "Friend" // type is inferred
}

Contact2(firstName: "Mahdi", lastName: "Pedram", type: "Friend")






struct Contact3 {
    var firstName: String // stored properties
    var lastName: String // can't change the constant
    var type: String
    
    init(firstName: String, lastName: String, type: String){
        self.firstName = firstName
        self.lastName = lastName
        self.type = type
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.type = "Friend"
    }
    
    func fullName() -> String {
        return "\(self.firstName) \(self.lastName)"
    }
}

Contact3(firstName: "Mahdi", lastName: "Pedram", type: "Friend")
var mahdi = Contact3(firstName: "Mahdi", lastName: "Pedram")

mahdi.fullName()
mahdi.firstName = "Tom"
mahdi.lastName = "Young"
mahdi.fullName()


//--------------------------------

enum Status {
    case Pending,
    Doing,
    Completed
    
    init(){
        self = .Pending
    }
}

struct Task {
    var description: String
    var status: Status
    
    init(description: String) {
        self.description = description
        self.status = Status()
    }
}

struct Todo {
    var tasks: [Task]
}


var task = Task(description: "task number 1")
task.status = .Completed






