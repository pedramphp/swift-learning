//: Playground - noun: a place where people can play

import UIKit


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

class Electronic: Product {
    var batteries: Bool? // Boolean Optional - Allow you with two states - value and nil
}

let toy = Electronic(title: "RC Car", price: 79)
toy.batteries
toy.batteries = true
toy.batteries!

print(toy.batteries)

if let batteries = toy.batteries {
    if batteries {
        print(batteries)
    }
}