import UIKit

// Closures




let vw = UIView()

UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})



// Trailing closure

let vw2 = UIView()

UIView.animate(withDuration: 0.5) {
    vw2.alpha = 0
}
