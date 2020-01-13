import UIKit

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)
// Result: "earth"

enum Planet2: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let venus = Planet2(rawValue: 2)
// Result: "venus"
