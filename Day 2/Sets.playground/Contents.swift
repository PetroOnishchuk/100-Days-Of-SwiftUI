import UIKit

let colors = Set(["red", "green", "blue"])


// Dublicate value : "red and blue" will be ignored.

let colors2 = Set(["red", "green", "blue", "red", "blue"])
print(colors2)
//Result: ["blue", "red", "green"]
