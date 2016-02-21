// From Structs to Classes

import UIKit

var str = "Hello, playground"

// Class only creates a default empty initializer
// Base class
class Product {
    let title: String
    let price: Double
    
    // Designated initializer
    init(title: String, price: Double){
        self.title = title
        self.price = price
    }
    
    // only if there is a naming conflict use `self`
    func discountedPrice(percentage: Double) -> Double {
        return price - (price * percentage / 100 )
    }
}

var quadcopter = Product(title: "Quadcopter", price: 12)
quadcopter.title
quadcopter.price
quadcopter.discountedPrice(50)


enum Size{
    case Small, Medium, Large
    init() {
        self = .Small
    }
}

// DRY - Don't Repeat Yourself.
// Clothing inherits of Product - use inheritance and subclass interchangibly.
// Product is the super class of Clothing class.
class Clothing: Product {
    var size = Size() // property of Clothing
    let designer: String
    
    // designated Initializer - as long as you initialize all the properties
    init(title: String, price: Double, designer: String) {
        self.designer = designer
        // DRY principle
        super.init(title: title, price: price)
    }
    
    // convenience initializer
    // you can't super initializer from convenience initializer
    convenience init (title: String){
        self.init(title: title, price: 99, designer: "Calvin Klein")
    }
    
    // overriding discountedPrice
    // the have the same method signature
    // method orverriding
    override func discountedPrice(percentage: Double = 10.0) -> Double {
        return super.discountedPrice(percentage)
    }
    
}

var tshirt = Clothing(title: "Vintage", price: 49.99, designer: "Prada")
tshirt.title
tshirt.price
tshirt.discountedPrice()
tshirt.size

// A convenience initializer can't call the designated initializer of a super class.
// A designated initializer can't call the convenience initializer of a super class.
// convenience initializer
var pink = Clothing(title: "pink stylish")
pink.price
pink.size
pink.designer

// Stored Properties - because they store values.
 
