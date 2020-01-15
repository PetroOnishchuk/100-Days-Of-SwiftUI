import UIKit
// Initializers





// Memberwise initializer

struct User {
    var username: String
}

var user = User(username: "twostraws")


// Own initializer with User2

struct User2 {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}



var user2 = User2()
user2.username = "twostraws"
