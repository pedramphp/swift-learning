//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Month {
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}


func schoolSemester(month: Month) -> String{
    switch month {
        case Month.August,
            Month.September,
            Month.October,
            Month.November,
            Month.December:
            
            return "Autumn"
        
        case Month.January,
            Month.February,
            Month.March,
            Month.April,
            Month.May:
        
            return "Sprint"
        
        default:
            return "No in the school year"
    }
}


func schoolSemester2(month: Month) -> String{
    switch month {
    case .August,
        .September,
        .October,
        .November,
        .December:
        
        return "Autumn"
        
    case .January,
        .February,
        .March,
        .April,
        .May:
        
        return "Sprint"
        
    default:
        return "No in the school year"
    }
}


var month = Month.April
month = .September
schoolSemester(month)

// Code completion prevents typos

// create custom raw value

enum MonthCustom: Int {
    case January = 1
    case February = 2
    case March = 3
    case April = 4
    case May = 5
    case June = 6
    case July = 7
    case August = 8
    case September = 9
    case October = 10
    case November = 11
    case December = 12
}

// create custom raw value

// leave the rest
enum MonthCustom2: Int {
    case January = 1
    case February
    case March
    case April
}

//Accessing Raw value
func monthsUntilWinterBreak(month: MonthCustom) -> Int {
    return MonthCustom.December.rawValue - month.rawValue
}

monthsUntilWinterBreak(MonthCustom.August)


// failable initializer - if it goes wrong it returns nil - raw value initializer returns options.
if let fifthMonth = MonthCustom(rawValue: 5) {
    monthsUntilWinterBreak(fifthMonth)
}

// Unordered raw values
enum Coin: Int {
    case Penny = 1
    case Nickel = 5
    case Dime = 10
    case Quarter = 25
}

let coin = Coin.Quarter
coin.rawValue


var coinPurse = [Coin.Quarter, Coin.Penny]

// Associated values
enum WithdrawalResult {
    case Success(Int)
    case Error(String)
}

var balance = 100
func withdraw(amount: Int) -> WithdrawalResult {
    if( amount <= balance ){
        balance -= amount
        return .Success(balance)
    } else {
        return .Error("Not enough Money")
    }
}

let result = withdraw(99)

switch result {
    case let .Success(newBalance):
        print("Your new balance is :\(newBalance)")
    
    case let .Error(message):
        print(message)
    
}


enum HTTPMethod {
    case GET
    case POST(String)
}


//Enumeration as state machine

enum TrafficLight {
    case Red,
    Yellow,
    Green
}

let trafficLight = TrafficLight.Green


enum Light {
    case ON, OFF
}


//optionals act like a container
var age: Int?
age = 17
age = nil


// .None there is no value
// .Some there is a value

let email: Optional<String> = .None
let website: Optional<String> = .Some("raywenderlich.com")


switch website{
case .None:
    print("No Value")
case let .Some(value):
    print("Got a value: \(value)")
}


var optionalNil: Optional<Int> = .None
optionalNil == nil
optionalNil == .None


