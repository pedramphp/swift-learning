//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//methods are functions that reside in a named type.


var numbers = [1,2,3]

numbers.removeLast()

let newArray = numbers


// move a function inside a name type

enum Month: Int {
    case January = 1,
    February,
    March,
    April,
    May,
    June,
    July,
    August,
    September,
    October,
    November,
    December
    
    init() {
        self = .January
    }
    
    func mothsUntilWinterBreak() -> Int {
        return Month.December.rawValue - self.rawValue
    }
}


let month = Month.October
month.mothsUntilWinterBreak()

let month2 = Month()
month2.rawValue
month2.mothsUntilWinterBreak()



// structures automatically offer a memberwise initializer
struct Date {
    var month: Month
    var day: Int
    
    
    init() {
        month = .January
        day = 1
    }
    
    // because we have created init we have to create the memberwise initializer as well.
    init(month: Month, day: Int){
        self.month = month
        self.day = day
    }
    
    mutating func changeDay() {
        day = 12
    }
    
    mutating func advance() {
        if day == 31 {
            day = 1
            
            if month.rawValue == 12 {
                month = Month.January
            } else {
                month = Month(rawValue: month.rawValue)!
            }
        } else {
            day++
        }
    }
}


var d = Date(month: .November, day: 31)
//d.changeDay()
d.advance()
d.day
d.month



// if you want to change a value in a value typed - strucutres you have to us mutating right next to the method. but this is not true for classes.


class Car {
    let make: String
    private(set) var speed: Int?
    private(set) var color: String
    
    init() {
        make = "Ford"
        color = "Black"
    }
    
    required init(make: String, color: String) {
        self.make = "Ford"
        self.color = color
    }
    
    func paint(color: String){
        self.color = color
    }
    
    func accelerate() {
        speed = 20
    }
    
    func applyBreaks() {
        speed = 0
    }
}


let car = Car(make: "Tesla", color: "Red")
car.paint("Blue")
car.accelerate()
car.speed
car.applyBreaks()
car.speed



// using setter and getters
class Circle {
    var radius: Double = 0
    var area: Double {
        get {
            return M_PI * radius * radius
        }
        
        set {
            //newValue
            radius = sqrt(newValue / M_PI)
        }
    }
    
    func growByAFactor(factor: Int) {
        area *= Double(factor)
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

var c = Circle(radius: 5)
c.area
c.area = 100
c.radius
