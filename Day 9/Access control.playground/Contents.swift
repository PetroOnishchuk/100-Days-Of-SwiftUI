import UIKit

// Access control

struct Person {
    var id: String

    init(id: String) {
        self.id = id
    }
}

let ed = Person(id: "12345")


// V2
struct Person2 {
    private var id: String

    init(id: String) {
        self.id = id
    }
}

var person2 = Person2(id: "56789")

// Can't read id
//person2.id


// V3
struct Person3 {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}


var person3 = Person3(id: "34434")
person3.identify()
// Result: "My social security number is 34434"
