import UIKit

// Lazy properties






struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}


struct Person {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")

ed.familyTree

