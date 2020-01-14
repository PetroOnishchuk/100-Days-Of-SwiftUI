import UIKit






let driving = { (place: String) in
    print("I'm going to \(place) in my car")
}


let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)
// Result: "I'm going to London in my car"

