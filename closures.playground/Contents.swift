// Closures

// This function takes a string and prints it

func printString(aString: String) {
    print("Printing \(aString) passed in")
}

printString("Hi my name is mahdi")


// func can be assigned to variables or constants

/*
*   Assigned the function to a constant. no need for paranthesis.
*/

// Functions are first class citizens
let someFunction = printString

someFunction("hi what's up")



func printInt(number: Int){
    print("Printing the number passed in: \(number)")
}

let numberOfApples = 3
printInt(numberOfApples)


func displayString(printStringFunc: (String) -> Void) {
    printStringFunc("I'm a function inside another one")
}

displayString(printString)


let allNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func isEvenNumber(i: Int) -> Bool {
    return i % 2 == 0
}


let ifEven = isEvenNumber

let evenNunbers  = allNumbers.filter(ifEven)



func printerFunction() -> (Int) -> () {
    var runningTotal = 0
    func printInteger(number: Int) {
        runningTotal += 10
        print("The integer passed in is \(runningTotal)")
    }
    return printInteger
}

let printAndReturnIntegerFunction = printerFunction()
printAndReturnIntegerFunction(2)
printAndReturnIntegerFunction(3)


let printAndReturnIntegerFunction2 = printerFunction()
printAndReturnIntegerFunction2(2)
printAndReturnIntegerFunction2(3)


func differenceBetweenNumbers(a: Int, b:Int) -> (Int) {
    return a - b
}

func mathOperation(operation: (Int, Int) -> Int, _ first: Int, _ second: Int) -> Int {
    return operation(first, second)
}

let difference = mathOperation(differenceBetweenNumbers, 10, 2)



// --------------------------------
// Closue Expressions

func doubler(i: Int) -> Int {
    return i*2
}

let doublerFunction = doubler

doublerFunction(5)

let numbers = [1,2,3,4,5]

let doubleNumbers = numbers.map(doublerFunction)

// Closure Expression Syntax

let tripledNumbers = numbers.map({(i: Int) -> Int in
    return i * 3
})

// Sorted functionie

var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]


func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

names.sort({ (s1: String, s2: String) -> Bool in
    return s1 < s2
})

// Rule #1
// No need to assign it just pass it directed
let trippleFunction  = {(i: Int) -> Int in
    return i * 3
}
numbers.map(trippleFunction)

// passign directly
numbers.map({(i: Int) -> Int in
    return i * 3
})

// Rule #2 Inferring Type from context
numbers.map({ i in return i * 3 })

// Rule #3 - Implicit returns from single expression closures
var t = numbers.map({ i in i * 3 })
t;

// Rule #4 - Shorthand argument names
// $0 - $1 - $2 ...

t = numbers.map({ $0 * 3 })
t

// Rule #5 - trailing closure - traling expression is the last parameter outside of the function
t = numbers.map(){
    $0 * 3
}

// cocotouch frameworks
/*
Function parameters are constants by default. Trying to change the value of a function parameter from within the body of that function results in a compile-time error. This means that you can’t change the value of a parameter by mistake.

However, sometimes it is useful for a function to have a variable copy of a parameter’s value to work with. You can avoid defining a new variable yourself within the function by specifying one or more parameters as variable parameters instead. Variable parameters are available as variables rather than as constants, and give a new modifiable copy of the parameter’s value for your function to work with.

Define variable parameters by prefixing the parameter name with the var keyword:
*/

t = numbers.map(){ (var digit) -> Int in
    if digit % 2 == 0 {
        return digit / 2
    } else {
        return digit
    }
}
t

//Rule #6 - ignore paranthesis
t = numbers.map{
    $0 * 3
}
