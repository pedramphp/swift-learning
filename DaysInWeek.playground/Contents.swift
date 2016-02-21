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

// it already knows that today is type Day.
today = .Tuesday


//Raw Values


enum Day3: Int {
    case Monday = 1,
    Tuesday = 2,
    Wednesday = 3,
    Thursday = 4,
    Friday = 5,
    Saturday = 6,
    Sunday = 7
}

func daysTillWeekend(day: Day3) -> Int{
   return Day3.Saturday.rawValue - day.rawValue
}

daysTillWeekend(Day3.Monday)
daysTillWeekend(Day3.Friday)



// system automatically add values sequential.

enum Day4: Int {
    case Monday = 1,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
    Sunday
}

func daysTillWeekend(day: Day4) -> Int{
    return Day4.Saturday.rawValue - day.rawValue
}

daysTillWeekend(Day4.Monday)
daysTillWeekend(Day4.Friday)

// create enum using Raw value
let firstDayOfWeekend = Day4(rawValue: 1)
// returns optional.
print(firstDayOfWeekend)

// returns nil for invalid rawValue
let tenthtDayOfWeekend = Day4(rawValue: 10)


if let firstDayOfWeekend = Day4(rawValue: 1) {
    daysTillWeekend(firstDayOfWeekend)
}

//Associated Value

enum Status{
    case Success(String)
    case Failure(String)
}

let downloadStatus = Status.Failure("network connection unavailable")


switch downloadStatus {
case .Success(let success):
    print(success)
case .Failure(let failure):
    print(failure)
}




