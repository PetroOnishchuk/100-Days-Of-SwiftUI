import UIKit






func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel()
result("London")



// V.2

func travel2() -> (String) -> Void {
    var counter = 1
    
    return {
        print("\(counter).I'am going to \($0)")
        counter += 1
    }
}

let result2 = travel2()

result2("London")
result2("London")
result2("London")
