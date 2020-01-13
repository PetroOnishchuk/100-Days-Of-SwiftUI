import UIKit

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]


favoriteIceCream["Paul"]

favoriteIceCream["Charlotte"]
// Return nil


// If no found ice crean for Charlote, we get back "Unknown" rather nil
favoriteIceCream["Charlotte", default: "Unknown"]
