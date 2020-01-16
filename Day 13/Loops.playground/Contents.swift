import UIKit

// Loops




print("1 x 10 is \(1 * 10)")
print("2 x 10 is \(2 * 10)")
print("3 x 10 is \(3 * 10)")
print("4 x 10 is \(4 * 10)")
print("5 x 10 is \(5 * 10)")
print("6 x 10 is \(6 * 10)")
print("7 x 10 is \(7 * 10)")
print("8 x 10 is \(8 * 10)")
print("9 x 10 is \(9 * 10)")
print("10 x 10 is \(10 * 10)")



for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}


var str = "Fakers gonna"

for _ in 1 ... 5 {
    str += " fake"
}

print(str)




// Looping over arrays


var songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs {
    print("My favorite song is \(song)")
}


var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0 ... 3 {
    print("\(people[i]) gonna \(actions[i])")
}


for i in 0 ..< people.count {
    print("\(people[i]) gonna \(actions[i])")
}


// Inner loops



people = ["players", "haters", "heart-breakers", "fakers"]
actions = ["play", "hate", "break", "fake"]


for i in 0 ..< people.count {
    var str = "\(people[i]) gonna"

    for _ in 1 ... 5 {
        str += " \(actions[i])"
    }

    print(str)
}



// While loops



var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 556 {
        break
    }
}

songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs {
    if song == "You Belong with Me" {
        continue
    }

    print("My favorite song is \(song)")
}

