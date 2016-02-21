// Computer Properties

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

class Furniture: Product {
    
    // Stored properties
    var height: Double
    var width: Double
    var length: Double
    
    // computed properties are `vars`
    // read - write needs get and set
    var surfaceArea: Double {
        get {
            return width * length;
        }
        set {
            length = sqrt(newValue)
            width = sqrt(newValue)
        }
    }
    
    init(   title: String,
            price: Double,
            height: Double,
            width: Double,
            length: Double) {
                
        // initializer the properties of current class first.
        self.height = height
        self.width = width
        self.length = length
        
        super.init(title: title, price: price)
    }
}

let table = Furniture(title: "Coffee Table", price: 300, height: 5, width: 10, length: 10)

// Getter method
table.surfaceArea = 144
table.width
table.length
table.surfaceArea
