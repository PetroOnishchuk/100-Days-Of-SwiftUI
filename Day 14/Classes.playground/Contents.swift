import UIKit

// Classes





class Person {
    var clothes: String
    var shoes: String

    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}






// Class inheritance
class Singer {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func sing() {
        print("La la la la")
    }
}



var taylor = Singer(name: "Taylor", age: 25)
taylor.name
taylor.age
taylor.sing()






class CountrySinger: Singer {
    override func sing() {
        print("Trucks, guitars, and liquor")
    }
}

var taylor2 = CountrySinger(name: "Taylor", age: 25)
taylor2.sing()






class HeavyMetalSinger: Singer {
    var noiseLevel: Int

    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }

    override func sing() {
        print("Grrrrr rargh rargh rarrrrgh!")
    }
}



