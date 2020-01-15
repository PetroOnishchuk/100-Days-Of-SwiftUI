import UIKit

// Copying objects



class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)


var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name)
// Result: "Justin Bieber"
