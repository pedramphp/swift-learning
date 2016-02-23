// Protocols

// Set of expected behavious

import UIKit


// blueprint of functionality, it doesn't provide implementation.
// whatever adapts this protocol must have the beolow properties.

// describes implmenetaiton but doesn't provide one
protocol FullyNameable {
    var fullName: String { get }
}


// Adopt a protocol - struct class and enums and adapt

// Provides and expectation of properties and behaviours
struct User: FullyNameable {
    var fullName: String
}

let user = User(fullName: "John Smith")


struct Friend: FullyNameable {
    let firstName: String
    let middleName: String
    let lastName: String
    
    // computed property
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

let friend = Friend(firstName: "John", middleName: "F", lastName: "Smith")
friend.fullName



// Protocol inheritance - composition - closely related classes similar behaviour methods but different implementation.

// Protocol first class type

import Foundation

protocol Payable {
    func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Int)
}

enum EmployeeType {
    case Manager
    case NotManager
}

class Employee {
    let name: String
    let address: String
    let startDate: NSDate
    let type: EmployeeType
    
    var department: String?
    var reportsTo: String?
    
    init(fullName: String, employeeAddress: String, employeeStartDate: NSDate, employeeType: EmployeeType) {
        self.name = fullName
        self.address = employeeAddress
        self.startDate = employeeStartDate
        self.type = employeeType
    }
}


func payEmployee(employee: Payable) {
    let paycheck = employee.pay()
}

class HourlyEmployee: Employee, Payable {
    var hourlyWage: Double = 15.00
    var hoursWorked: Double = 10
    let availableVacation = 0
    
    func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Int) {
        return (hourlyWage * hoursWorked, 0, 0, availableVacation)
    }
}

let hourlyEmployee = HourlyEmployee(fullName: "Pasan", employeeAddress: "none", employeeStartDate: NSDate(), employeeType: .NotManager)

payEmployee(hourlyEmployee)

let employee = Employee(fullName: "Gabe", employeeAddress: "some address", employeeStartDate: NSDate(), employeeType: .Manager)

/*****************************************/


// Protocol helps model loose relationship
protocol Blendable {
    func blend()
}

class Fruit: Blendable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func blend() {
        print("I'm mush")
    }
}

class Dairy {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Cheese: Dairy {}

class Milk: Dairy, Blendable {
    func blend() {
        print("I haven't changed. I'm still milk")
    }
}

func makeSmoothie(ingredients: [Blendable]) {
    for ingredient in ingredients {
        ingredient.blend()
    }
}

let strawberry = Fruit(name: "Strawberry")
let cheddar = Cheese(name: "Cheddar")
let chocolateMilk = Milk(name: "Chocolate")

let ingredients: [Blendable] = [strawberry, chocolateMilk]

makeSmoothie(ingredients)

/*****************************************/

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 129968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom/m
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator:LinearCongruentialGenerator())

