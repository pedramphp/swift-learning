//: [Previous](@previous)

import Foundation

enum Day5: Int {
    case Monday = 1,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
    Sunday
    
    // you have access to self
    func daysTillWeekend() -> Int{
        return Day5.Saturday.rawValue - self.rawValue
    }
}


var today2: Day5 = Day5.Monday