/* 
The challenge here is to implement the longestRun function so that the
longest run of the same continuous character will be selected from a String.
This excercise lends itself to TDD and we have provided a few basic tests below.
*/

// import Cocoa

func longestRun(whole: String) -> String {
    var currentMaxLen = 0
    var currentMaxChar:Character = " "
    var currentLen = 0
    var currentChar:Character = " "
    for char in whole.characters {
        if char != currentChar {
            currentChar = char
            currentLen = 1
        }
        else {
            currentLen++
        }

        if currentLen > currentMaxLen {
            currentMaxLen = currentLen
            currentMaxChar = currentChar
        }

    }

    var subStr = ""
    for _ in 1...currentMaxLen {
        subStr.append(currentMaxChar)
    }

    return subStr
}

let result = longestRun("zzzz")

// identity test
var zzzz = "zzzz"
assert(zzzz == longestRun(zzzz), "\(zzzz) should be the longest run of chars")

print("hello linux \(result)")

// book
// var book = "book"
// assert("oo" == longestRun(book), "longest run in \(book) is 'oo'")

