//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var todo = ["Return Calls", "Write a Blog Post", "Cook Dinner"]
todo

// Explicitly array of strings
var todo2: [String] = ["Return Calls", "Write a Blog Post", "Cook Dinner"]

// Add an array to an array


// shorthand += - append to an array
todo += ["Pick up Laundry", "Brush teeth"]

var number = 10
number += 10

todo[0]

// dot syntax
todo.count


// variables properties and functions
//defining attributes
// functions changes the behaviour of the shape

// Append function
todo.append("Edit Blog Post")
todo

// Update items
todo[2] = "Clean Dishes"
todo

// remove last item from an array
let item = todo.removeLast()
item // removed item
todo

let item2 = todo.removeAtIndex(1)
item2

todo

// inserting item
// atIndex is a label, what it requires
// arguments are seperated by comma
todo.insert("Go to gym", atIndex: 0)
todo







