// Days in week

import UIKit

let days = ["Monday", "Thuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]


// you can misspell
func weekdayOrWeekend(dayOfWeek: String) -> String {
    
    switch dayOfWeek {
    case "Monday", "Thuesday", "Wednesday", "Thursday", "Friday":
        return "it's week day"
    case "Saturday", "Sunday":
        return "It's wekened"
    default:
        return "Not a Valid day"
    }
}


weekdayOrWeekend("Monday")

weekdayOrWeekend("Saturday")

weekdayOrWeekend("Satu")

// not sure what day you are passing
weekdayOrWeekend(days[5])


// this code is vulnurable and fragile


// Type Day and all possible values.
// no longer need String
// Member values of type enum `Day`

enum Day {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

// you don't need all cases
enum Day2 {
    case Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
    Sunday
}



func weekdayOrWeekend(dayOfWeek: Day) -> String {
    
    switch dayOfWeek {
        
    case .Monday,
    .Tuesday,
    .Wednesday,
    .Thursday,
    .Friday:
        return "it's week day"
        
    case Day.Saturday, Day.Sunday:
        return "Yay, It's wekened"
        
    default:
        return "Not a Valid day"
        
    }
}

weekdayOrWeekend(Day.Monday)

var today = Day.Monday
today


