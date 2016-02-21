//: Playground - noun: a place where people can play

import UIKit


class Shape {
    let sides: Int
    let name: String
    
    init(sides: Int, name: String){
        self.sides = sides
        self.name = name
    }
}

class Square: Shape {
    var sideLength: Double
    
    var area: Double {
        get {
            return sideLength * sideLength;
        }
        
        set {
            sideLength = sqrt(newValue)
        }
    }
    
    init(sides: Int, name: String, sideLength: Double){
        self.sideLength = sideLength
        super.init(sides: sides, name: name)
    }
    
    convenience init(sideLength: Double){
        self.init(sides: 4, name: "Square", sideLength: sideLength)
    }

    /*
    init(sideLength: Double){
        self.sideLength = sideLength
        super.init(sides: 4, name: "Square")
    }
    */
}

let square = Square(sideLength: 20)
square.sides
square.sideLength
square.area
square.area = 100
square.sideLength
