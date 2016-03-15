/* 
The challenge here is to implement the longestRun function so that the
longest run of the same continuous character will be selected from a String.
This excercise lends itself to TDD and we have provided a few basic tests below.
*/

import Cocoa

func longestRun(whole: String) -> [String] {
    
    let allRuns = stringToRunsList(whole)
    let longestRuns = findLongestRuns(allRuns)
    let longestRunStrings = longestRuns.map({String($0)})
    return longestRunStrings
}

func stringToRunsList(whole: String) -> [[Character]] {
    
    var chars = [[Character]]()
    
    for index in whole.characters.indices {

        let daChar = whole[index]
        let onDaRun = chars.last?.contains(daChar)

        // nil coalescing operator for da win
        if (onDaRun ?? false)  {
            chars[chars.endIndex.predecessor()].append(daChar)
        } else {
            chars.append([daChar])
        }
    }
    return chars
}

func findLongestRuns(runs: [[Character]]) -> [[Character]] {
    
    let longestRunCount = runs.reduce(0, combine: { $0 > $1.count ? $0 : $1.count })

    let longestRuns = runs.filter({ $0.count == longestRunCount })

    return longestRuns
}

// identity test
let zzzz = "zzzz"
let zzzzRuns = stringToRunsList(zzzz)
assert(zzzzRuns.count == 1, "\(zzzzRuns) should have just one run")
assert(zzzzRuns[0].count == 4, "\(zzzzRuns) only run should be 4 long")
assert([zzzz] == longestRun(zzzz), "\(zzzz) should be the longest run of chars")

let abc = "abc"
let abcRuns = stringToRunsList(abc)
assert(abcRuns.count == 3, "\(abcRuns) makes a run list of three")
assert("a" == abcRuns[0][0], "\(abc) should be a single char list of lists")
assert("b" == abcRuns[1][0], "\(abc) should be a single char list of lists")
assert("c" == abcRuns[2][0], "\(abc) should be a single char list of lists")

// book
let book = "book"
let runsBook = stringToRunsList(book)
let longestRunBook = longestRun(book)
assert(runsBook.count == 3, "\(runsBook) should be like the number of runs")
assert(longestRunBook.count == 1, "\(longestRunBook) should be just one")
assert(["oo"] == longestRunBook, "longest run in \(book) is 'oo'")

// two equally long longest runs test
var zzzzyyyy = "zzzzyyyy"
assert(["zzzz", "yyyy"] == longestRun(zzzzyyyy), "\(zzzzyyyy) should be the longest run of chars")

// unicode test
var emojis = "😝😎😎😎😛"
assert(["😎😎😎"] == longestRun(emojis), "😎😎😎 should be the longest run of chars")

