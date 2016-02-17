//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

var distance = 121

if distance < 5 {
    print("\(distance) miles is near") // string interpolation
} else if distance >= 5 {
    print("\(distance) miles is close") // string interpolation
} else {
    print("\(distance) miles is far") // string interpolation
}

// && - AND Operator
// || - OR Operator
// ! - NOT Operator


// Boolean expression
if true && true {
    print("And")
}

if distance > 5 && distance < 20 {
    print("And")
}

// Either one of the expressions are true
if distance > 5 || distance < 20 {
    print("Or")
}


// FizzBuzz generator

var number = 15;

for number in 1...20 {
    if (number % 5 == 0) && (number % 3 == 0) {
        print("FizzBuzz")
    } else if number % 3 == 0 {
        print("Fizz")
    } else if number % 5 == 0 {
        print("Buzz")
    } else {
        print(number)
    }
}
