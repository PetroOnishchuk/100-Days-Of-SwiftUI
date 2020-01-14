import UIKit

var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

// Will never executed
while false {
    print("This is false")
}

repeat {
    print("This is false")
} while false
