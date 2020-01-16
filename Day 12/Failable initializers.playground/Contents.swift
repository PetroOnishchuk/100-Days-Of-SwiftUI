import UIKit

// Failable initializers



let str = "5"
let num = Int(str)

struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let peroson = Person(id: "12345")
// Result: Nil
