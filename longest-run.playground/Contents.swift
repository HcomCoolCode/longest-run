/* 
The challenge here is to implement the longestRun function so that the
longest run of the same continuous character will be selected from a String.
This excercise lends itself to TDD and we have provided a few basic tests below.
*/

import Cocoa

func longestRun(whole: String) -> String {
    if whole.characters.count == 0 {
        return ""
    }
    
    var newString = ""
    var previousChar: Character?
    
    for char in whole.characters {
        if previousChar != nil && char != previousChar {
            newString += "."
        }
        
        newString += "\(char)"
        previousChar = char
    }
    
    let components = newString.characters.split { $0 == "." }.map(String.init)
    let sortedComponents = components.sort { $0.characters.count > $1.characters.count }
    
    return sortedComponents.first!
}

// identity test
assert("zzzz" == longestRun("zzzz"))
assert("oo" == longestRun("book"))
assert("zz" == longestRun("zzabb"))
assert("" == longestRun(""))
assert("aaaa" == longestRun("jjsaaaaifjsaiotjsijiijsidjaoisdoauioeuwiqiewjqiejwqhehhwqe"))


