//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let cards = 1...13
// switch statement has power features
for card in cards {
    switch card {
    case 11:
        print("Jack")
    case 12:
        print("Queen")
    case 13:
        print("King")
    default:
        print(card)
    }
}


// switch statement has power features
// switch statements are favored over if statement.
for card in cards {
    switch card { // card can be any type
    case 1, 11...13:
        print("Trump cards")
    default:
        print(card)
    }
}
