//: Playground - noun: a place where people can play

import UIKit

//Structurs are named type - encapsulate related properties and behaviour

struct Location {
    let latitude: Double
    let longitude: Double
}

struct DeliveryRange {
    var range: Double
    let center: Location
}

struct PizzaOrder {
    var topping: String
    var size: String
    var userLocation: Location
    var storeLocation: Location
}



let pizzaLocation = Location(latitude: 44.9871, longitude: -93.2758)

let storeLocation = Location(latitude: 33.9871, longitude: -93.2758)
var pizzaRange = DeliveryRange(range: 200, center: storeLocation)

print(pizzaRange.range) //accessing member
print(pizzaRange.center.latitude) // accessing member of members


pizzaRange.range = 250 // because it is a var



func isInRange(storeDeliveryRange: DeliveryRange, userLocation: Location) -> Bool {
    
    let difference = sqrt(pow(storeDeliveryRange.center.latitude - userLocation.latitude, 2) - pow(storeDeliveryRange.center.longitude - userLocation.longitude, 2))
    
    let distance = difference * 0.02
    
    return distance < storeDeliveryRange.range
    
}

isInRange(pizzaRange, userLocation: Location(latitude: 44.1, longitude: 42.3))

// custom initializer

struct LocationInitializer {
    let latitude: Double
    let longitude: Double
    
    // overrides the default initializer
    init(coordinateString: String) {
        let crdSplit = coordinateString.characters.split(",")
        latitude = atof(String(crdSplit.first!))
        longitude = atof(String(crdSplit.last!))
    }
}

let coords = LocationInitializer(coordinateString: "44.9871, -93.2758")
print(coords.latitude)
print(coords.longitude)


// many initializers

struct Order {
    var toppings: [String]
    var size: String
    var crust: String
    
    // exactly like the auto generator, since we have more initializers we had to explicitly write it.
    init(toppings: [String], size: String, crust: String) {
        self.toppings = toppings
        self.size = size
        self.crust = crust
    }
    
    init(size: String, crust: String){
        self.toppings = ["Cheese"]
        self.size = size
        self.crust = crust
    }
    
    init(special: String){
        self.size = "Large"
        self.crust = "Regular"
        
        if special == "Veggie" {
            
            self.toppings = ["Tomatoes", "Green Pepper", "Mushrooms"]
        
        } else if special == "Meat" {
        
            self.toppings = ["Sausage", "Pepperoni", "Ham", "Bacon"]
            
        } else {
            
            self.toppings = ["Cheese"]
        
        }
    }
}


struct DeliveryRangeSpecial {
    var range: Double
    let center: Location
    
    init(center: Location, range: Double) {
        self.center = center // use self to prevent shadowing
        self.range = range
    }
    
    init(center: Location) {
        self.center = center
        range = 150
    }
}

struct DeliveryRangeType {
    let range: Int
    let center: Location
    let rangeType: String
    
    // all properties needs to be assigned in init
    init(center: Location, rangeType: String) {
        self.center = center
        self.rangeType = rangeType
        
        if rangeType == "City" {
        
            self.range = 100
        
        } else { // if rangeType == "Suburb"
            
            self.range = 150
            
        }
    }
}

// no need to assign `var` optionals to init because they have default value of nil

struct ClimateControl {
    var temprature: Double
    var humidity: Double? // make sure it's not constant though.
    
    init(temprature: Double){
        self.temprature = temprature
    }
}

// default value for properties

struct ClimateControlDefaultValue {
    var temperature: Double = 60.0
    var humidity: Double?
}

let defaultClimate = ClimateControlDefaultValue()
// because it has default value no need to pass values

print(defaultClimate.temperature)


struct DeliveryRangeString {
    let range: Int
    let center: LocationInitializer
    
    init(center: LocationInitializer, range: Int) {
        self.center = center // use self to prevent shadowing
        self.range = range
    }
    
    init(location center: LocationInitializer) {
        self.center = center
        range = 150
    }
}



//------------------------
// program for pizza delivery ranges

let pizzaJoints = [
    DeliveryRangeString(location: LocationInitializer(coordinateString: "44.9871, -93.2758")),
    DeliveryRangeString(location: LocationInitializer(coordinateString: "9513, -93.0942"))
]

print(pizzaJoints)

func isInRangeJoints(customer: LocationInitializer) -> Bool {
    
    for joint in pizzaJoints {
        
        let difference = sqrt(pow(joint.center.latitude - customer.latitude, 2) - pow(joint.center.longitude - customer.longitude, 2))
        
        if difference < Double(joint.range) {
            return true
        }
        
    }
    
    return false
}

let customer = LocationInitializer(coordinateString: "44.9850, -93.2750")

print(isInRangeJoints(customer))


// structs can have their own functions
struct DeliveryRangeWithMethod {
    var range: Double
    let center: LocationInitializer
    
    // method
    func isInRange(customer: LocationInitializer) -> Bool {
        
        let difference = sqrt(pow(center.latitude - customer.latitude, 2) - pow(center.longitude - customer.longitude, 2))
        
        let distance = difference * 0.02
        
        return distance < range
    }
    
}

let range = DeliveryRangeWithMethod(range: 150, center: LocationInitializer(coordinateString: "44.9850, -93.2750"))

range.isInRange(customer)




// you can add methods in an extension. it will available for all instances.
extension LocationInitializer {
    func isNorthernHemisphere() -> Bool {
        return latitude > 0.0
    }
}

let locatioWithHemisphere = LocationInitializer(coordinateString: "44.9850, -93.2750")

locatioWithHemisphere.isNorthernHemisphere()

// this is good to extend types you don't own.

extension String {
    func evenOrOdd() -> String {
        return characters.count % 2 == 0 ? "Event!" : "Odd!"
    }
}

"I'm Odd".evenOrOdd()

// structs are passed by value not reference. because they are value types
// value semantic === value type  === passed by value === values are copied on assignment

//Int is also a value type - struct
// Array, Float, Double, Bool, Dictionary, Set, String are all structs.
// integeres, Booleans and strings are primite types pointint to 64 Bit raw memory
/*public strct Int {
    
}*/

struct TShirt {
    var size: String
    var color: String
    var material: String
    
    func calculateCost() -> Double {
        //logic goes here
        return 10.0
    }
}

var tshirt = TShirt(size: "Large", color: "blue", material: "cotton")
tshirt.calculateCost()

struct Ship {
    var origin: Location
    var destination: Location
    var length: Int
    
    func shoot -> String {
        
    }
}


