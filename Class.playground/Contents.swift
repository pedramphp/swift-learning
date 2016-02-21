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


// Clothing inherits of Product - use inheritance and subclass interchangibly.
// Product is the super class of Clothing class.
class Clothing: Product {
    var size = Size(); // property of Clothing
}

var tshirt = Clothing(title: "Vintage", price: 49.99)
tshirt.title
tshirt.price
tshirt.discountedPrice(10)
tshirt.size

 