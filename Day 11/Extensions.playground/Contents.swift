import UIKit

// Extensions



extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()
// Result: 64


extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

let number2 = 10
number2.isEven
// Result: true
