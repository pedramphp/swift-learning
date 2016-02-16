//: Playground - noun: a place where people can play

import UIKit

// declaring or creating a new variable.
var str = "Hello "
str

// all variables are lowercase, starts with a lowerCase letter.
// camelCase - capitalize the second word
// it's all about readibility
// let is constant
let modernProgrammingLanguage = "Swift"

var greeting = str + modernProgrammingLanguage


// Explicit value types are in C++, java

var myStr: String = "value"

// Implicit types - Inferred types

var myStr2 = "value"

// print is a function
print("To Build an iPhone app we need to learn swift")

// disable the \n use terminator
print(modernProgrammingLanguage, terminator: "")

print(modernProgrammingLanguage + " is a great language")

//String interpolation
print("\(modernProgrammingLanguage) is a great language")

// Terminologies.

// mutable variable
var language = "Swift"

// immutable
let lang = "swift"

// concatination - adding 2 or more strings
var concat = "this is a great language: " + lang

//String interpolation - insert a variable inside a string
var greeting2 = "Hello \(language)"
