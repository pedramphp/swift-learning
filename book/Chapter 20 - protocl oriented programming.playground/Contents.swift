//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol TeamRecord {
    var wins: Int { get }
    var losses: Int { get }
    func winningPercentage() -> Double
    
}

// you can have the actual implementation in the extension.
extension TeamRecord {
    var gamesPlayed: Int {
        return wins + losses
    }
    
    // default implementation
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses))
    }
}

struct BaseballRecord: TeamRecord {
    var wins: Int
    var losses: Int
}

struct HockeyRecord: TeamRecord {
    var wins: Int
    var losses: Int
    var ties: Int
    let gamesPlayed:Int = 20
    
    
    // overrides winningPercentage
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
    }
}

let b = BaseballRecord(wins: 10, losses: 5)
b.gamesPlayed

let h:TeamRecord = HockeyRecord(wins: 10, losses: 5, ties: 13)
h.winningPercentage()
h.gamesPlayed // beacuase gamesPlayed is not added in the TeamRecord Protocol it won't look inthe Hockey Record since h is a teamrecord.



// Type Constraints

protocol PlayoffEligible {
    var minimumWinsForPlayoffs: Int { get }
}

// all adaptors of TeamRecord that also adopt PlayoffEligible
extension TeamRecord where Self: PlayoffEligible {
    func isPlayoffEligible() -> Bool {
        return self.wins > minimumWinsForPlayoffs
    }
}


struct HockeyRecord2: TeamRecord {
    var wins: Int
    var losses: Int
    var ties: Int
    
    
    // overrides winningPercentage
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
    }
}


protocol Tieable {
    var ties: Int { get }
}

extension TeamRecord where Self: Tieable {
    func winningPercentage() -> Double {
        return Double(wins) / (Double(wins) + Double(losses) + Double(ties))
    }
}


struct HockeyRecord3: TeamRecord, Tieable {
    var wins: Int
    var losses: Int
    var ties: Int
}

let hockeyRecord: TeamRecord = HockeyRecord3(wins: 8, losses: 7, ties: 1)
hockeyRecord.winningPercentage() // only Tieable protocols have winning percentage

//programming to interfaces, not implementations












