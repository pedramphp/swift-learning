//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// user defined named type: Protocol

// protocols are not instantiatable they are interfaces or templates


enum Direction {
    case Left
    case Right
}

//Idea of a Vehicle
protocol Vehicle {
    var weight: Int { get }
    var name: String { get set }
    func accelerate()
    func stop()
    func turn(direction: Direction)
    func descriptions() -> String
}

// protocols does not contain implementation


protocol WheeledVehicle: Vehicle {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}

class Unicycle: WheeledVehicle {
    var weight: Int = 1
    var name: String = ""
    
    var numberOfWheels: Int {
        return 2
    }
    
    private var myWheelSize: Double = 16.0
    
    var wheelSize: Double {
        get {
            return myWheelSize
        } set {
            myWheelSize = newValue
        }
    }
    
    func accelerate() {
    
    }
    
    func stop() {
    
    }
    
    func turn(direction: Direction) {
    }
    
    func descriptions() -> String {
        return ""
    }
}


class Unicycle2: WheeledVehicle {
    var weight: Int = 1
    var name: String = ""
    
    let numberOfWheels: Int = 2 //because it is getter. but you can consider it var as well.
    var wheelSize: Double = 16.0
    
    func accelerate() {
        
    }
    
    func stop() {
        
    }
    
    func turn(direction: Direction) {
    }
    
    func descriptions() -> String {
        return ""
    }
}


//typealias - deferrin to the protocol adapter the exact type 

protocol WeightCalculatable {
    typealias WeightType
    
    func calculateWeight() -> WeightType
}

class HeavyThing: WeightCalculatable {
    typealias WeightType = Int
    
    func calculateWeight() -> Int {
        return 100
    }
}

class LightThing: WeightCalculatable {
    typealias WeightType = Double
    
    func calculateWeight() -> Double {
        return 0.0025
    }
}

//class inherits from as many protocols

protocol Wheeled {
    var numberOfWheels: Int {
        get
    }
}

class Bike: Vehicle, Wheeled {
    var weight: Int = 1
    var name: String = ""
    
    let numberOfWheels: Int = 2 //because it is getter. but you can consider it var as well.
  
    func accelerate() {
        
    }
    
    func stop() {
        
    }
    
    func turn(direction: Direction) {
    }
    
    func descriptions() -> String {
        return ""
    }
}


protocol WheeledVehicle2: Vehicle, Wheeled {
    
}


protocol WhatType {
    var typeName: String { get }
}

extension String: WhatType {
    var typeName: String {
        return "I'm a String"
    }
}

let myType: String = "Swit by Tutorials"
myType.typeName

// protocols in action

// equatable.

struct Record {
    var wins: Int
    var losses: Int
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)


//extension Record: Equatable {}
extension Record: Comparable {}

func == (lhs: Record, rhs: Record) -> Bool {
    return lhs.wins == rhs.wins && lhs.losses == rhs.losses
}

func < (lhs: Record, rhs: Record) -> Bool {
    let lhsPercent = Double(lhs.wins) / (Double(lhs.wins) + Double(lhs.losses))
    let rhsPercent = Double(rhs.wins) / (Double(rhs.wins) + Double(lhs.losses))
    
    return lhsPercent < rhsPercent
}



// swift automatically genertes  > != >= <= operators all you have to provide is = and <
recordA == recordB
recordA < recordB
recordA > recordB

let team1 = Record(wins: 23, losses: 8)
let team2 = Record(wins: 23, losses: 8)
let team3 = Record(wins: 14, losses: 11)


// because you have implemeted the COmparable and Equatable you can use these free functions

let leagueRecords = [team1, team2, team3]
leagueRecords.sort()

leagueRecords.maxElement()
leagueRecords.minElement()
leagueRecords.startsWith([team1, team2])
leagueRecords.contains(team1)


// Hashable Protocol

class Student {
    var studentId: Int = 2
    var firstName: String;
    var lastName: String;
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension Student: Equatable {}
func == (lhs: Student, rhs: Student) -> Bool {
    return lhs.studentId == rhs.studentId
}

extension Student: Hashable {
    var hashValue: Int {
        return studentId
    }
}


// now you can use it in a Set or Dictionary
let john =  Student(firstName: "Johnne", lastName: "Appleseed")

// Dictionary
let lockerMap: [Student: String] = [john: "14B"]

// Set
let classRoster: Set<Student> = [john, john, john]
classRoster.count

//BooleanType or truthy or falsy - because swift is a protocl-heavy language

extension Record: BooleanType {
    var boolValue: Bool {
        return wins > losses
    }
}

if Record(wins: 10, losses: 5) {
    print("winning")
}

extension Record: CustomStringConvertible {
    var description: String {
        return "\(wins) - \(losses)"
    }
}

// overrides the print statement.
print(recordA)

