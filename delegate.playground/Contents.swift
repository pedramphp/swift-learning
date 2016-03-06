//: Playground - noun: a place where people can play

import UIKit

// Design patterns: 

// Delegate Pattern - Decorator pattern
// How to compose objects to form larger structures.


/*
what is a delegate


Delegate: carry out a set of tasks for another object
generalized object that can handle specific task.

RaceDelegate
A()
B()

// optional type delegate
var delegate = RaceDelegate?


any object that conforms
*/


protocol RaceDelegate{
    func raceDidStart()
    func raceStatus(lapNumber: Int, first: AnyObject)
    func raceDidEnd(winner: AnyObject)
}



class Race {
    var laps: Int = 0
    var delegate: RaceDelegate?
    
    func start(){}
    func updateProgress(){}
    func end(){}
}