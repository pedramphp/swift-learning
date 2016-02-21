//: Playground - noun: a place where people can play

import UIKit

// Blueprint for enum
enum Day: Int {
    case Monday = 1,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
    Sunday
    
    // instance of day should be assigned to monday by default
    init() {
        self = .Monday
    }
    
    // you have access to self
    func daysTillWeekend() -> Int{
        return Day.Saturday.rawValue - self.rawValue
    }
    
    func dayString() -> String {
        
        switch self {
        case .Monday:
            return "Monday"
        default:
            return "Other Day"
        }
    }
}


// load enum initialization
var today = Day()
today.rawValue
today.dayString()
