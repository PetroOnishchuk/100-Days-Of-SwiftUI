import UIKit

// Optional chaining



func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}

let album = albumReleased(year: 2006)
print("The album is \(album)")



let str = "Hello world"
print(str.uppercased())

let album2 = albumReleased(year: 2006)?.uppercased()
print("The album is \(album2)")



// The nil coalescing operator

let album3 = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album3)")

