//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



//Bird - Airplane --- Has-A - for flying .
// protocols can inherit from other protocols
// particular aspect - limited subset of the behaviour - composition is better
protocol Fly {
    
}

class Bird {}


// Jetplane is a Airplane === Inheritance

class Airplane {}
class Jetplane: Airplane {}


//---------------------


// pritibale Object
protocol Printable {
    func description() -> String
}

protocol PrettyPrintiable: Printable {
    func prettyDescription() -> String
}


// Conform to printable
struct User: PrettyPrintiable {
    let name: String
    let age: Int
    let address: String
    
    func description() -> String {
        return "\(name) \(age), \(address)"
    }
    
    func prettyDescription() -> String {
        return "\(name) \(age)\n, \(address)"
    }
}

let user = User(name: "mahdi", age: 20, address: "some address")
user.description()


//------------------------
// Swift Standard Library
// - Can DO - OBJECT CAN DO - EQUATABLE - COMPARING OBJECTS - COMPARIBLE - HASHABLE - INDEXABLE - ALL OF THEM HAVE 'ABLE' - THESE ARE SOMETHING THAT YOUR OBJECTS DO.
// - IS A: COLLECTION TYPE - INTEGER TYPE
// - CAN BE: MODEL BEHAVIOUR - ARRAY LITERAL CONVERTABLE - FLOAT LITERAL CONVERABLE, NilLeteralConvertible - convert from one type to another - have suffic convertible.
// Protocol Oriented Programming Language

// Carefully defining the interfaces to your objects 
// Prefer Composition over inheritance to create flexible objects


enum Direction {
    case Up, Down, Right, Left
}

protocol Movable {
    func move(direction: Direction, distance: Int)
}

protocol Distructable {
    func decreaseHealth(factor: Int)
}

protocol Attackable {
    var strength: Int { get }
    var range: Int { get }
    func attack(player: PlayerType)
}

protocol PlayerType {
    var position: Point {get set}
    var life: Int {get set}
    init(point: Point)
}



struct Point {
    var x: Int
    var y: Int
    
    func pointsAroundMe(withRange range: Int) -> [Point] {
        var results: [Point] = []
        
        for x in (self.x - range)...(self.x + range) {
            for y in (self.y - 1)...(self.y + 1) {
                let point = Point(x: x, y: y)
                results.append(point)
            }
        }
        
        return results
    }
}


class Enemy: PlayerType, Distructable, Attackable, Movable {
    var position: Point
    var life: Int = 2
    var strength: Int = 5
    var range: Int = 2
    
    
    required init(point: Point) {
        self.position = point
    }
    
    func decreaseLife(factor: Int){
        self.life -= factor
    }
    
    func decreaseHealth(factor: Int) {
        life -= factor
    }
    
    func move(direction: Direction, distance: Int){
        switch direction {
        case .Up: position.y += 1
        case .Down: position.y -= 1
        case .Left: position.x -= 1
        case .Right: position.x += 1
        }
    }
    
    func attack(player: PlayerType){
        
    }
}
/*
class Tower {
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    init(position: Point) {
        self.position = position
    }
    
    func fireAtEnemy(enemy: Enemy) {
        if inRange(self.position, range: self.range, target: enemy.position) {
            while enemy.life >= 0 {
                enemy.decreaseHealth(strength)
            }
            print("Enemy vanquished!")
        } else {
            print("Darn! Out of range!")
        }
    }
    
    func inRange(position: Point, range: Int, target: Point) -> Bool {
        let availablePositions = position.pointsAroundMe(withRange: range)
        for point in availablePositions {
            if point.x == target.x && point.y == target.y {
                return true
            }
        }
        return false
    }
}


*/


// Encampsulate common behaviour
// Is-A or Has-A
// Protocols are fully fledge types
// Protocol Inheritance
// Multiple protocol inheritance allows composition of functionality by combining types as you need
// Protocols in Swift can be used wherever a type is expected
