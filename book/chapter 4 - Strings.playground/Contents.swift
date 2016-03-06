//: Playground - noun: a place where people can play

import UIKit
import Darwin

var str = "Hello, playground"


let charA: Character = "a"

str.uppercaseString

let firstName: String = "Mahdi"
let lastName: String = "Pedramrazi"
let fullName: String = "\(firstName) \(lastName)"

let value = 10
let multiplier = 5

let sum = "\(value * multiplier)"

var number = 10

switch (number) {
case 10:
    print("Zero")
case 1:
    print("Zero")
default:
    print("hi")
}



let num = 10

switch (num) {
case let x where x % 2 == 0:
    print("Event")
default:
    print("Odd")
    
}



let age = 20

switch (age) {
case let x where x >= 0 && x <= 2:
    print("Infant")
    
case let x where x >= 3 && x <= 12:
    print("Child")
    
case let x where x >= 13 && x <= 19:
    print("Teenager")
    
case let x where x >= 20 && x <= 39:
    print("Adult")
    
case let x where x >= 40 && x <= 60:
    print("Middle aged")
    
case let x where x >= 61:
    print("Elderly")

default:
    break
}


let person: (name: String, age: Int) = ("Mahdi", 30)

switch (person) {
case (let y, let x) where x >= 0 && x <= 2:
    print("\(y) is Infant")
    
case (let y, let x) where x >= 3 && x <= 12:
    print("\(y) is Child")
    
case (let y, let x) where x >= 13 && x <= 19:
    print("\(y) is Teenager")
    
case (let y, let x) where x >= 20 && x <= 39:
    print("\(y) is an Adult")
    
case (let y, let x) where x >= 40 && x <= 60:
    print("\(y) is Middle aged")
    
case (let y, let x) where x >= 61:
    print("\(y) is Elderly")
default:
    break
}


let closedRange = 0...5
let halfOpenRane = 0..<5


let hourOfDay = 12
let timeOfDay: String

switch (hourOfDay){
case 0...5:
    timeOfDay = "Early Morning"
    
case 6...11:
    timeOfDay = "Morning"
    
case 12...16:
    timeOfDay = "Afternoon"
    
case 17...19:
    timeOfDay = "Evening"
    
case 20..<24:
    timeOfDay = "Late evening"
    
default:
    timeOfDay = "INVALID HOUR!"
    
}

timeOfDay

var sum2: Int = 0

for var i = 1; i <= 10; i++ {
    sum2 += i
}

var sum3: Int = 0

for i in 1...10 {
    sum3 += i
}




func printTest(m: Int, exter exter2:Int) {
    print(exter2)
}

printTest(12, exter: 5)


func multipleAndDivide(number: Int, by byValue:Int) -> (multiple: Int, divide: Int){

    return (number * byValue, number / byValue)

}

let result = multipleAndDivide(50, by: 10)
result.divide
result.multiple


func increment(inout value: Int){
    value++
}

var a: Int = 12
increment(&a)


/*
func printFullName(firstName: String, lastName: String) {
    print("\(firstName) \(lastName)")
}
printFullName("Mahdi", lastName: "Pedramrazi")
*/


func printFullName(firstName: String, _: String) {
    print("\(firstName) \(lastName)")
}

printFullName("Mahdi", "Pedramrazi")


func calculateFullName(firstName: String, lastName: String) -> (fullName: String, count: Int) {
    
    let f =  "\(firstName) \(lastName)"
    
    return (f, f.characters.count)
}

var result5 = calculateFullName("Mahdi", lastName: "Pedramrazi")
result5.fullName
result5.count




func isNumberDivisible(number: Int, by byNumber: Int) -> Bool {
    return number % byNumber == 0
}

isNumberDivisible(10, by: 2)
isNumberDivisible(10, by: 3)

func isPrime(number: Int) -> Bool {

    if number <= 2 {
        return false
    }
    
    let sqrtNumber = Int(sqrt(Double(number)))
    
    for i  in 2...sqrtNumber{
        if(isNumberDivisible(number, by: i)){
            return false
        }
    }
    
    return true
}

isPrime(0)
isPrime(6)
isPrime(13)
isPrime(8893)


func fibonacci(num: Int) -> Int{
    if num == 0 || num == 1 {
        return 1
    }
    
    var fibs: [Int] = [1, 1]
    
    for var i = 2; i <= num; i++ {
        fibs.append(fibs[i-1] + fibs[i-2])
    }
    
    return fibs[num]
    
    //return fibonacci(num - 1) + fibonacci(num - 2)
    
}

fibonacci(0)
fibonacci(1)
fibonacci(2)
fibonacci(3)
fibonacci(4)
fibonacci(5)






var optionalInt: Int? = 10

var result222: Int = optionalInt ?? 0







