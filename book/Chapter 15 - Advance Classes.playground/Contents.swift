//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("\(firstName) \(lastName) is being removed from memory!")
    }
}

class Grade {
    var letter: String = ""
}

// student is inheriting Grade
// subclasses are additive
class Student: Person {
    var grades: [Grade] = []
    weak var partner: Student? // weak reference helping memory leak or retain cycles.
    
    func recordGrade(grade: Grade){
        grades.append(grade)
    }
    
    // force all subclasses of Student to only implement this initializer, but als use this initializer when they make their calls to super.init.
    override required init(firstName: String, lastName: String) {
        grades = []
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(transfer: Student) {
        self.init(firstName: transfer.firstName, lastName: transfer.lastName)
    }
}

// Person is superclass or base class
// student is a subclass
// class can inherit from only one other class - single inheritance

let john = Person(firstName: "Johnney", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")

class StudentAthlete: Student {
    var failedClasses: [Grade] = []
    var sports: [String] = []
    
    required init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    // two phase initialization
    init(firstName: String, lastName: String, sports: [String]) {
        // initialize stored properties of local class after than initalize the super class.
        self.sports = sports;
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(transfer: Student, sports: [String]) {
        self.init(firstName: transfer.firstName, lastName: transfer.lastName, sports: sports)
    }
    
    override func recordGrade(grade: Grade) {
        super.recordGrade(grade) // invoke method in the nearest implementing superclass
        
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    
    func athleteIsEligible() -> Bool {
        return failedClasses.count < 3
    }
}

class StarStudentAthlete: StudentAthlete {
    
}

// a chain of classes is class hierarchy
// StarStudentAthlete -> StudentAthlete -> Student -> Person

//Student/Person relationship is polymorphism
//ability to trean an object differently based on context. - Polymorphism

// you can treat StarStudentAthelete as a Person

// Example of polymorphism

func phonebookName(person: Person) -> String {
    return "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Johnney", lastName: "Appleseed")
let star = StarStudentAthlete(firstName: "Jane", lastName: "Appleseed")

print( phonebookName(person) )
print( phonebookName(star) )

//use `final` keyword to guarantee a class never get a subclass.

final class Mahdi: Student {
    
}

class Atefe: Student {
    // protect method from being overridden
    final func isBeautiful(){
        
    }
}

// initially make any class you write as final. - you explicit 2- shorten the compile time.


// mechanism when to clean up objects on the heap is called    `reference counting` or `retain count`
// automatic reference count - ARC
