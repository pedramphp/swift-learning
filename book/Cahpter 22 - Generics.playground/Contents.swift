//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Generics: Means to express systematic variations at the level of types as opposed to the level of values


enum PetKind {
    case Cat
    case Dog
    case Snake
}

struct KeeperKind {
    var keeperOf: PetKind
}

let catKeeper = KeeperKind(keeperOf: .Cat)
let dogKeeper = KeeperKind(keeperOf: .Dog)
let snakeKeeper = KeeperKind(keeperOf: .Snake)

// varying the values of types - it's not scalable

enum EnumKeeperKind {
    case CatKeeper
    case DogKeeper
    case SnakeKeeper
}

// Types defined by other types.
// varying the types it self.

struct Cat {
    var name: String
}
struct Dog {
    var name: String
}

struct keeperForCats {}
struct keeperForDogs {}


//generics using one set of types to define a new set of types.

struct Keeper<T> {
    var name: String
    var morningAnimal: T
    var afternoonAnimal: T
}

var aCatKeeper = Keeper<Cat>(
    name: "mew",
    morningAnimal: Cat( name: "mew1"),
    afternoonAnimal: Cat( name: "mew2")
)

func swapped<T, U>(x: T, _ y: U) -> (U, T) {
    return (y, x)
}

swapped(33, "Jay")



