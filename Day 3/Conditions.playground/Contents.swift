import UIKit

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
}



if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}


if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}
