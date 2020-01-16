import UIKit


// Array

var evenNumbers = [2, 4, 6, 8]
var songs = ["Shake it Off", "You Belong with Me", "Back to December"]
songs[0]
songs[1]
songs[2]


type(of: songs)
// Result: Array<String>.Type




// Array operators


songs = ["Shake it Off", "You Belong with Me", "Back to December"]
var songs2 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var both = songs + songs2
both += ["Everything has Changed"]
