//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//structures represent values - classes represent objects


// there is no initializer automatically, we have to define it ourselves.
// structures are immutable value but clases are mutable reference


// classes are in the heap memory but structures are in the stack
// stack automatically destroy its objects.

// heap doesn't support automatic destroy for objects, you are responsible for it
// heap is slower process compared to stack.
// address of the memory are stored in the stack


class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

var john = Person(firstName: "Johnney", lastName: "Appleseed")

var homeOwner = john

john.firstName = "Johm"

print(john.firstName)
print(homeOwner.firstName)

homeOwner.lastName = "Grabanski"

print(john.fullName())
print(homeOwner.fullName())

//identity of the object
print(john === homeOwner)

// == id for values
// === compares the memory address of two references.

// classes are mutable

struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}

class Student {
    var firstName: String
    var lastName: String
    private var grades: [Grade] = []
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(grade: Grade) {
        grades.append(grade) // `grades` is getting mutates
    }
    
    func getGPA() -> Double{
        
        var totalPoints: Double = 0.0
        
        for grade in grades {
            totalPoints += grade.points
        }
        
        return totalPoints / Double(grades.count)
    }
}

let jane = Student(firstName: "Jane", lastName: "Appleseed")
let history = Grade(letter: "B", points: 9.0, credits:  3.0)
let math = Grade(letter: "A", points: 16.0, credits:  4.0)

jane.recordGrade(history)
jane.recordGrade(math)
jane.getGPA()
// if you do this with structs you get a build failure because structs are immutable.



// three levels of access control - public - internal - private
// default is internal.

public let publicScring: String = "Everyone can see me!"

internal class InternalClass {
    
    private func sayHi() {
        print("Hi")
    }
    
    func speak() {
        sayHi()
    }
}

print(publicScring)

let myClass = InternalClass()

myClass.sayHi()

myClass.speak()

// private is at the file level not the class level


//struct is values and classes as things
// temperature and delivery time range is a value
// person or student is a thing
// struct - fast - stack
// classes - slow - heap
// start with struct, if it gets complicated it change it to class

class MovieList {
    var name: String
    var movies: Set<String> = []
    
    init(name: String, movies: Set<String>) {
        self.name = name
        self.movies = movies
    }
    
    func printList() {
        for movie in movies {
            print(movie)
        }
    }
}

class User{
    
    var lists: Dictionary<String, MovieList> = [:]
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func addList(list: MovieList) {
        lists[list.name] = list
    }
    
    func getList(name: String) -> MovieList {
        return lists[name]!
    }
    
}

var comedyMovies: MovieList = MovieList(name: "comedy", movies: ["dumb and dumber", "vacation"])
comedyMovies.printList()

var jane2 = User(name: "jane")

jane2.addList(comedyMovies)


var john2 = User(name: "john")
john2.addList(comedyMovies)


class TShirt {
    var size: String
    var color: String
    var price: Double
    var image: Bool?
    
    init(size:String, color:String, price: Double) {
        self.size = size
        self.color = color
        self.price = price
    }
}

struct ShoppingCart {
    var tshirts: [TShirt] = []
    var user: TShirtUser
    
    func totalCost() -> Double {
        
        var total: Double = 0.0
        
        for tshirt in tshirts {
            total += tshirt.price
        }
        
        return total
    }
    
}

struct Address {
    var name: String
    var street: String
    var city: String
    var zipCode: Int
    
}

class TShirtUser {
    var name: String
    var email: String
    var shoppingCard: ShoppingCart?
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}



