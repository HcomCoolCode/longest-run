/* 
The challenge here is to implement the longestRun function so that the
longest run of the same continuous character will be selected from a String.
This excercise lends itself to TDD and we have provided a few basic tests below.
*/

import Cocoa

func longestRun(whole: String) -> [String] {
    return [whole]
}

// identity test
var zzzz = "zzzz"
assert([zzzz] == longestRun(zzzz), "\(zzzz) should be the longest run of chars")

// book
// var book = "book"
// assert("oo" == longestRun(book), "longest run in \(book) is 'oo'")

