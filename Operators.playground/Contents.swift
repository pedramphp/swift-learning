//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Additions

var x = 1 + 2

// height and width of room doesn't change

let height = 12 // In Feet
let width = 10 // In Feet

// area of the room
let area = height * width // In Feed Sq

// `/` devision sign
// 1 sq. Meter = 1 sq. foot / 10.764
// use Double to convert a variable to a Double
let areaInMeters = Double(area) / 10.764


// Remainder Operator
let chairWidth = 3
let spaceRemaining = width % chairWidth
let chairs = width / chairWidth
