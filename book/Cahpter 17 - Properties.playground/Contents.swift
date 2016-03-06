//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



enum Type {
    case Work, Family, Friend
}

struct Contact {
    var fullName: String
    let emailAddress: String
    var type: Type = .Friend // default value.
}

//computed property must be defined as a variabe


struct TV {
    var height: Double
    var width: Double
    var diagonal : Int { // computed property
        let aSquared = pow(height, 2)
        let bSquared = pow(width, 2)
        let cSquared = aSquared + bSquared
        
        let c = sqrt(cSquared)
        
        let rounded = round(c)
        
        return Int(rounded)
    }
    
    var superDianonal: Int {
        get {
            return Int(round(sqrt(height * height + width * width)))
        }
        set {
            let ratioWidth: Double = 16
            let ratioHeight: Double = 9
            // newValue is the new diagonal value.
            height = Double(newValue) * ratioHeight / sqrt(ratioWidth * ratioWidth + ratioHeight * ratioHeight)
            width = height * ratioWidth / ratioHeight
            
        }
    }
}


var tv = TV(height: 53.93, width: 95.87)
let size = tv.diagonal
tv.width = 53.93
let diagonal = tv.diagonal
tv.superDianonal = 100
tv.width
tv.height


// type property
struct Level {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool { //property observers
        didSet {
            if unlocked && id > Level.highestLevel {
                Level.highestLevel = id
            }
        }
    }
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)


let highestLevel = Level.highestLevel
// it's static you can access it from anywhere.

//Singleton Pattern

class GameManager {
    static let defaultManager = GameManager() // creates a singleton
    var gameScore = 0
    var saveState = 0
    
    private init(){
    }
}

GameManager.defaultManager.gameScore = 1024
GameManager.defaultManager.saveState = 12


//Limiting a variable using property observer
class LightBulb {
    static let maxCurrent = 40
    var currentCurrent = 0 {
        didSet { // after setting -  property observer
            if currentCurrent > LightBulb.maxCurrent {
                print("Current too high, falling back to prevous settings.")
                currentCurrent = oldValue
            }
        }
        willSet(newValue) { // before setting - property observer

            if newValue <= LightBulb.maxCurrent {
                currentCurrent = newValue
            }
        }
    }
}

var light = LightBulb()
light.currentCurrent = 50
light.currentCurrent
light.currentCurrent = 40
light.currentCurrent



// Lazy Stored Property
class Circle {
    lazy var pi = {
        return ((4.0 * atan(1.0 / 5.0) - atan(1.0 / 239.0) * 4.0))
    }() // lazy stored property - only gets calculated the first time - and only gets calculated when you access it.
    
    var radius: Double = 0
    
    var circumference: Double {
        return pi * radius * radius
    }
    
    init (radius: Double){
        self.radius = radius
    }
}

// pi should be a var because by default has no value and the value gets set when is  requested. - runtime changes the property value

let circle = Circle(radius: 5)
circle.pi
M_PI // default standard PI value.

// store properties are uniqe to each instance.


