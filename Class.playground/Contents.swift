// From Structs to Classes

import UIKit

var str = "Hello, playground"

// Class only creates a default empty initializer
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


 