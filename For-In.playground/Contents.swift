//: Playground - noun: a place where people can play

import UIKit

var todo: [String] = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6"
]


// item is constant
for item in todo {
    print(item)
}

// 10 is inclusive - 1 to 10
// ... close range
for number in 1...10 {
    print("\(number) times 2 is \(number * 2)")
}



// 10 is inclusive - 1 to 9
// ..< half close range - upper limit is non inclusive
for number in 1..<10 {
    print("\(number) times 2 is \(number * 2)")
}

