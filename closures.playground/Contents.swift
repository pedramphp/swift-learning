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



