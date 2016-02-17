//: Playground - noun: a place where people can play

import UIKit

var todo: [String] = [
    "1",
    "2",
    "3",
    "4",
    "5"
]


var index = 0

while index < todo.count{
    print(todo[index])
    index++; //unary operator
}

// Repat While

// Loop to execute at least once

index  = 0

repeat {
    print(todo[index])
    index++; //unary operator
} while index < todo.count

