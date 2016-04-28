//: Playground - noun: a place where people can play

import UIKit

var str = "Generics"


// decouple the purpose of the function from the data type

func switchero <T>(inout a: T,inout _ b: T) {
    let tempA = a;
    a = b;
    b = tempA;
}

var five = 5
var ten = 10

// & means we are using inouts
switchero(&five, &ten)

five
ten


var fivePT = 5.1
var tenPT = 10.1
switchero(&fivePT, &tenPT)
fivePT
tenPT





// Dynamic typing and polymorphism.
// Arrays are Generics



protocol Person {
    var name: String { get }
    var hometown: String {get}
    var height: Double {get}
    
    typealias PositionType
    var positions: PositionType {get}
}

struct Team {
    var name: String
    var city: String
    var winPCT: Double = 0.0
    
    init(name: String, city: String) {
        self.name = name;
        self.city = city;
    }
}

struct Player: Person {
    var name: String
    var height: Double
    var hometown: String
    typealias PositionType = Array<String>
    var positions: PositionType
}

struct Executive {
    var name: String
    var height: Double
    var hometown: String
    var positions: String
}

extension Executive: Person {
    
}

struct Coach: Person {
    var name: String
    var height: Double
    var hometown: String
    typealias PositionType = String
    var positions: PositionType
}


// using a where clause
func allItemsMatch<P1: Person, P2: Person where P1.PositionType == P2.PositionType>(p1: P1, p2: P2 ) -> Bool {
    return true
}



let testCoach = Coach(name: "mahdi", height: 12, hometown: "san jose", positions: "one")
let testPlayer = Player(name: "Ricky Henderson", height: 11, hometown: "berkeley", positions: ["1", "2"])

// type constrains and generics
func getPersonalInfo <T: Person> (person: T) -> String {
    return "You are selected \(person.name) from \(person.hometown)"
}


allItemsMatch(testPlayer, p2: testPlayer)

class StatGroup<Element>{
    var members: Array<Element>
    
    var title: String
    
    init(title: String, members: [Element]) {
        self.title = title;
        self.members = members
    }
}


var blazers = Team(name: "Blazers", city: "Portland");
var nuggets = Team(name: "Nuggets", city: "Denver");

var hoopsUS = StatGroup(title: "NBA West", members: [blazers, nuggets])
hoopsUS.members



var star = Player(name: "Pasan", height: 88, hometown: "san jose", positions: ["1", "2"])
var benchwarmer = Player(name: "Andrew", height: 66, hometown: "san jose", positions: ["1", "2"] )


var iceFencingUS = StatGroup (title: "Olympic Ice fencing", members: [star, benchwarmer])

iceFencingUS.members



var a: Array<Int> = [1,2,3]



func getLarger <T: Comparable> (a: T, b: T) -> T {
    if ( a > b ){return a;}
    return b;
}

getLarger(12, b: 10 )
