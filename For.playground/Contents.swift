//: Playground - noun: a place where people can play

import UIKit

var todo: [String] = [
    "1",
    "2",
    "3",
    "4",
    "5"
]


var index = 0 // index

while index < todo.count{ // condition
    print(todo[index])
    index++; //unary operator //increment
}

// For was created in C language

for var i = 0; i < todo.count; i++ {
    print(todo[i])
}