//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// the art of failing gracefully is error handling

enum RollingError: ErrorType {
    case Doubles
    case OutOfFunding
}

func test() throws {
    let error: RollingError
    
    error = .Doubles
    throw error
}


enum Direction {
    case Left
    case Right
    case Forward
}

enum PogBotError: ErrorType {
    case DidNotTurnLeft(directionMoved: Direction)
    case DidNotTurnRight(directionMoved: Direction)
    case DidNotGoForward(directionMoved: Direction)
    case EndOfPath
    
}


// failable initializer than can fail without crashing your app

class PugBot {
    let name: String
    let correctPath: [Direction]
    
    var currrentStepInPath = 0
    
    init? (name:String, correctPath: [Direction]){
        self.correctPath = correctPath
        self.name = name
        
        guard (correctPath.count > 0 ) else {
            return nil
        }
        
        switch name {
            case "Delia", "Olive", "Frank", "Otis", "Doug":
                break
        default:
            return nil
        }
        
        movePugBotSafely { () -> () in
            try self.goHome()
            try self.moveForward()
        }
    }
    
    func movePugBotSafely(move: () throws -> ()) -> String {
        
        do {
        
            try move()
            return "Completed move successfully."

        } catch PogBotError.DidNotTurnLeft(let directionMoved) {
            
            return "was suppose to turn left but moved \(directionMoved)"
            
        } catch PogBotError.DidNotTurnRight(let directionMoved) {
        
            return "was suppose to turn right but moved \(directionMoved)"
        
        } catch PogBotError.DidNotGoForward(let directionMoved) {
            
            return "was suppose to go forward but moved \(directionMoved)"
        
        } catch {
            return "An unkown error occured"
        }

    }
    
    func goHome() throws {
        try moveForward()
        try turnLeft()
        try moveForward()
        try turnRight()
    }
    
    func turnLeft() throws {
        guard (currrentStepInPath < correctPath.count) else {
            throw PogBotError.EndOfPath
        }
        
        let direction = correctPath[currrentStepInPath]
        
        if direction != .Left {
            throw PogBotError.DidNotTurnLeft(directionMoved: direction)
        }
        currrentStepInPath++
    }
    
    func turnRight() throws {
        guard (currrentStepInPath < correctPath.count) else {
            throw PogBotError.EndOfPath
        }
        
        let direction = correctPath[currrentStepInPath]
        
        if direction != .Right {
            throw PogBotError.DidNotTurnRight(directionMoved: direction)
        }
        
        currrentStepInPath++
    }
    
    func moveForward() throws {
        guard (currrentStepInPath < correctPath.count) else {
            throw PogBotError.EndOfPath
        }
        
        let direction = correctPath[currrentStepInPath]
        
        if direction != .Forward {
            throw PogBotError.DidNotGoForward(directionMoved: direction)
        }
        
        currrentStepInPath++
    }
}

let rightDirections: [Direction] = [.Forward, .Left, .Forward, .Right]
let wrongDirections: [Direction] = [.Left, .Left, .Left, .Forward]

let invalidPug = PugBot(name: "lassie", correctPath: rightDirections)

let myPugBot = PugBot(name: "Delia", correctPath: rightDirections)

let wrongPugBot = PugBot(name: "Delia", correctPath: wrongDirections)

