import UIKit

// Functions



func favoriteAlbum() {
    print("My favorite is Fearless")
}


favoriteAlbum()


func favoriteAlbum2(name: String) {
    print("My favorite is \(name)")
}


favoriteAlbum2(name: "Fearless")





func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)
printAlbumRelease(name: "Speak Now", year: 2010)
printAlbumRelease(name: "Red", year: 2012)








// External and internal parameter names


func countLettersInString(string: String) {
    print("The string \(string) has \(string.count) letters.")
}

countLettersInString(string: "Hello")


func countLettersInString2(myString str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString2(myString: "Hello")



func countLettersInString3(_ str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString3("Hello")







func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}

countLetters(in: "Hello")







// Return values

func albumIsTaylor(name: String) -> Bool {
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true }
    if name == "Speak Now" { return true }
    if name == "Red" { return true }
    if name == "1989" { return true }

    return false
}

if albumIsTaylor(name: "Red") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}

if albumIsTaylor(name: "Blue") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}

