//: Playground - noun: a place where people can play

import UIKit

// Struct is Value Type - the value gets copied
// All basic types in swift are value types
// Int, Double, String, Array, Dictionary, Bool.


// Class is Reference Type - reference is passed. - 
// reference of a location in memory


// By default go with value type.
// Mmeory management is much easier, you are copieng values and not dealing with references.

// class = reference type
class ProductClass {
    var title: String
    var price: Double = 0.0
    
    init(title: String, price: Double){
        self.title = title
        self.price = price
    }
}

var phoneClass = ProductClass(title: "iPhone 6", price: 800)
var bigPhoneClass = phoneClass // passing the reference
bigPhoneClass.title
bigPhoneClass.title = "iPhone 6+"
phoneClass.title


// struct or enum =  value type
struct ProductStruct {
    var title: String
    var price: Double = 0.0
}

var phoneStruct = ProductStruct(title: "Nexus", price: 500)
var bigPhoneStruct = phoneStruct // copied the value
bigPhoneStruct.title
bigPhoneStruct.title = "iPhone 6+"
phoneStruct.title

// Value types:
// - Has one owner
// - No dependencies on other owners
// - Copying is cheap over time - no need for managing reference counting
// - Comparision is easy - just comparing the values

