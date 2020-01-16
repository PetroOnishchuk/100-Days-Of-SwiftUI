import UIKit

// Protocol-oriented programming


protocol Identifiable {
    var id: String { get set }
    func identify()
}

extension Identifiable {
    func identity() {
        print("My ID is \(id).")
    }
}


struct User: Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
    
    var id: String
}

let twostraws = User(id: "twostraws")
twostraws.identify()
