/*
The challenge here is to implement the longestRun function so that the
longest run of the same continuous character will be selected from a String.
This excercise lends itself to TDD and we have provided a few basic tests below.
*/

import Cocoa

extension String {

    func componentsSeparatedByCharacterDifference() -> Array<String> {

        let seperateString = " "
        var previousChar:Character = " "
        var stringWithSpaces:String = ""
        for char in self.characters {
            if char != previousChar {
                stringWithSpaces.appendContentsOf(seperateString)
            }
            stringWithSpaces.append(char)
            previousChar = char
        }
        return stringWithSpaces.componentsSeparatedByString(seperateString)
    }
}



func longestRun(string: String) -> [String] {

    let sortedArrayOfStrings = string.componentsSeparatedByCharacterDifference().sort { $0.characters.count > $1.characters.count }

    let lengthOfFirstSortedString = sortedArrayOfStrings.first?.characters.count

    return sortedArrayOfStrings.filter() { lengthOfFirstSortedString == $0.characters.count }
}



var result = longestRun("")
assert(result == [""])

result = longestRun("aaabbbc")
assert(result == ["aaa", "bbb"])

result = longestRun("x")
assert(result == ["x"])

result = longestRun("ab")
assert(result == ["a", "b"])

result = longestRun("abb")
assert(result == ["bb"])

result = longestRun("abbb")
assert(result == ["bbb"])

result = longestRun("aaaabbb")
assert(result == ["aaaa"])

result = longestRun("adddbb")
assert(result == ["ddd"])

result = longestRun("adcc")
assert(result == ["cc"])

result = longestRun("xxxaddccyyyy")
assert(result == ["yyyy"])


