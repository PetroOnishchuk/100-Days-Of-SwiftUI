import UIKit

// Optionals







func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}



var status: String?
status = getHaterStatus(weather: "rainy")



func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let haterStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}




func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    return nil
}



var items = ["James", "John", "Sally"]





func position(of string: String, in array: [String]) -> Int {
    for i in 0 ..< array.count {
        if array[i] == string {
            return i
        }
    }

    return 0
}




let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items)




// Force unwrapping optionals

func yearAlbumReleased2(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    return nil
}

var year = yearAlbumReleased2(name: "Red")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year)")
}


print("It was released in \(year!)")

