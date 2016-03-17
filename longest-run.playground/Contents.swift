/* 
The challenge here is to implement the longestRun function so that the
longest run of the same continuous character will be selected from a String.
This excercise lends itself to TDD and we have provided a few basic tests below.
*/

import Cocoa

func longestRun(whole: String) -> String {
    let characters = whole.characters

    var currentRunCharacter = characters.first
    var currentRun = 0
    var longestRunCharacter = currentRunCharacter
    var longestRun = 0

    if currentRunCharacter == nil {
        return ""
    }

    characters.forEach({(let char: Character) -> () in
        if char == currentRunCharacter! {
            currentRun += 1
        } else {
            currentRunCharacter = char
            currentRun = 1
        }
        if longestRun < currentRun {
            longestRun = currentRun
            longestRunCharacter = currentRunCharacter
        }
    })
    return String([Character](count: longestRun, repeatedValue: longestRunCharacter!))
}

// identity test
var zzzz = "zzzz"
assert(zzzz == longestRun(zzzz), "\(zzzz) should be the longest run of chars")

// book
var book = "book🐰🐰🐰🐰aaa"
assert("🐰🐰🐰🐰" == longestRun(book), "longest run in \(book) is 'oo'")
