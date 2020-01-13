import UIKit

var name = (first: "Taylor", last: "Swift")


//Acces item using numeric position.
name.0
// Result: Taylor

// Access item using thei name.
name.first
// Result: Taylor


// You can change the values inside a tuple after you create
name = (first: "Ariana", last: "Grande")

// You can't change name of items
// last = age
// You can't change types of values
// age = 26
//name = (first: "Ariana", age: "26")
