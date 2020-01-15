import UIKit

// Referring to the current instance



struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

let person = Person(name: "Ariana")


