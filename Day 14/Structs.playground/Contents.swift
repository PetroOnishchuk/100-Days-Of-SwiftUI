import UIKit

// Structs




struct Person {
    var clothes: String
    var shoes: String
}




let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")


print(taylor.clothes)
print(other.shoes)



// Functions inside structs

struct Person2 {
    var clothes: String
    var shoes: String

    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

