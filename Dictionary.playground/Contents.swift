//: Playground - noun: a place where people can play

import UIKit

// Dictionary - Key Value pair

var countries = [
    "CA": "Canada",
    "BE": "Belgium",
    "FR": "France",
    "DE": "Germany",
    "UK": "United Kingdom"
]

//Box bracket
countries["CA"]

// optionals allow you a value or nothing

countries["US"] = "United States"

countries

// Dictionary don't have order

countries["US"] = "United States of America"
countries

let item = countries.removeValueForKey("US")

print(item!)

countries
