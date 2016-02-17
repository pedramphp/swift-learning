//: Playground - noun: a place where people can play

import UIKit

//https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-XID_483

// Optional can have a value or nil
// adding ? to any type will create optional
// ! operator unwraps value from optional.
// simplest way to unwrap value is if-let statement

var str = "Hello, playground"

// String? is optional
func findApt (aptNumber: String) -> String? {
    let aptNumbers = ["101", "102", "103", "104"]
    
    for tempAptNumber in aptNumbers {
        if tempAptNumber == aptNumber {
            return aptNumber // conditional return statement
        }
    }
  return nil
}

// returns an optional
let culprit = findApt("101")
print(culprit)
print(culprit!) // unwrap value

// Don't try to unwrap an optional that has a value


// if let statement
// if the value is not nil it will get assigned to culprit
if let culprit2 = findApt("101") {
    print("Apt Found")
} else {
    print("Not Found")
}


if let culprit3 = findApt("102") {
    print("Apt Found \(culprit3)")
} else {
    print("Not Found")
}


func sendNoticeTo(aptNumber: Int) {
     print("Apt Found \(aptNumber)")
}


if let culprit4 = findApt("102") {
    if let aptNumber = Int(culprit4) { // Int returns ?
       sendNoticeTo(aptNumber)
    }
} else {
    print("Not Found")
}



//  better way
if let culprit4 = findApt("101"){
    sendNoticeTo(Int(culprit4)!)
} else {
    print("Not Found")
}


func isDivisible(dividend dividend: Int, devisor: Int) -> Bool? {
    if dividend % devisor == 0 {
        return true
    }
    return nil
}


if let result = isDivisible(dividend: 10, devisor: 20) {
    print("divisible")
} else {
    print("not divisible")
}

if let result = isDivisible(dividend: 20, devisor: 20) {
    print("divisible")
} else {
    print("not divisible")
}


