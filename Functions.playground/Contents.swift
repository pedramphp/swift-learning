// Functions

import UIKit

// https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-XID_248

// Passing a parameter
print("Swift function")


func calculateArea(height: Int, width: Int) -> Int {

    return height * width
    
}

// job of a function is to do repetitive tasks
print("Area = \(calculateArea(12, width: 10))")

calculateArea(12, width: 100000)



