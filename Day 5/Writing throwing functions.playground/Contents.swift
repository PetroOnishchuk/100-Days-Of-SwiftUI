import UIKit







enum PasswordError: Error {
    case obvious
}


func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

try checkPassword("password")
