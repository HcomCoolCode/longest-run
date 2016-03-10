/* 
The challenge here is to implement the longestRun function so that the
longest run of the same continuous character will be selected from a String.
This excercise lends itself to TDD and we have provided a few basic tests below.
*/

import Cocoa

func calculateLongestRun(string: String, var longestCount: Int = 0, var longestRuns: Set<String> = Set()) -> Set<String> {
    if string.characters.count == 0 {
        return longestRuns
    }
    
    var currentRun = ""
    var remainingString = string
    
    for character in string.characters {
        if character == string.characters.first {
            remainingString.removeAtIndex(remainingString.startIndex)
            currentRun += String(character)
        } else {
            break
        }
    }
    
    if currentRun.characters.count >= longestCount {
        if currentRun.characters.count > longestCount {
            longestRuns = []
        }
        
        longestRuns.insert(currentRun)
        longestCount = currentRun.characters.count
    }
    
    return calculateLongestRun(remainingString, longestCount: longestCount, longestRuns: longestRuns)
}

// identity test
assert(["zzzz"] == calculateLongestRun("zzzz"))
assert(["oo"] == calculateLongestRun("book"))
assert(["zz", "bb"] == calculateLongestRun("zzabb"))
assert([] == calculateLongestRun(""))
assert(["a"] == calculateLongestRun("a"))
assert(["aaaa"] == calculateLongestRun("jjsaaaaifjsaiotjsijiijsidjaoisdoauioeuwiqiewjqiejwqhehhwqel"))
assert(["☺️☺️☺️"] == calculateLongestRun("☺️☺️☺️aa"))
assert(["bb", "☺️☺️", "aa"] == calculateLongestRun("☺️bbx124512909☺️☺️aa"))
assert(["☺️☺️", "bb", "aa"] == calculateLongestRun("☺️bbx124512909☺️☺️aa"))
