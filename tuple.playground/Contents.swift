// Tuple

import UIKit

func searchNames(name name: String) -> (found: Bool, description: String) {
    let names = ["Andrew", "Mahdi", "John"]
    
    var found = (false, "\(name) is not a TreeHouse Teather")
    
    for n in names {
        if n == name {
            found = (true, "\(name) is a TreeHouse Teather")
        }
    }
    
    return found
}

let result = searchNames(name: "Mahdi")

result.0
result.1
result.found
result.description

// Decomposing a tuple

let (found, description) = searchNames(name: "Mahdi")
found
description


let (_, description2) = searchNames(name: "Mahdi")
// no need to access found
description2
