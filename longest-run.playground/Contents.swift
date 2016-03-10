/* 
The challenge here is to implement the longestRun function so that the
longest run of the same continuous character will be selected from a String.
This excercise lends itself to TDD and we have provided a few basic tests below.
*/

import Cocoa

struct Part {
    var index : Int
    var length : Int
    
    func fromString(whole:String) -> String {
        let start = whole.startIndex.advancedBy(index)
        let end = whole.startIndex.advancedBy(index+length)
        let range = Range<String.Index>(start: start, end:end)
        return whole.substringWithRange(range)
    }
    
    func longestPart(other:Part?) -> Part {
        if other?.length >= length {
            return other!
        }
        else {
            return self
        }
    }
    
    var debugDescription : String {
        return "index: \(index) length:\(length)"
    }
}

let testPart1 = Part(index: 1, length: 3)
assert(testPart1.fromString("Foozball") == "ooz")

let testPart2 = Part(index: 1, length: 2)
assert(testPart1.longestPart(testPart2).fromString("Foozball") == "ooz")


func findLongestRun(chars:[String], index:Int = 0, currentLength:Int = 0, lastCharacter:String? = nil, longestPart:Part? = nil) -> Part? {
    
    // if we come to the end of the string we create one last part and return the longest
    if index >= chars.count {
        let newPart = Part(index: index - currentLength, length: currentLength)
        return newPart.longestPart(longestPart)
    }
        
    else {
        let newCharacter = chars[index]
        
        // if the last run ended, create a new part
        if lastCharacter != nil && lastCharacter != newCharacter {
            let newPart = Part(index: index - currentLength, length: currentLength)
            return findLongestRun(chars, index: index + 1, currentLength: 1, lastCharacter: newCharacter, longestPart: newPart.longestPart(longestPart))
        }
        else {
            return findLongestRun(chars, index: index + 1, currentLength: currentLength + 1, lastCharacter: newCharacter, longestPart: longestPart)
        }
    }
}


func longestRun(whole: String) -> String {
    let chars = whole.characters.map( { String($0) } )
    if let longestPart = findLongestRun(chars) {
        return longestPart.fromString(whole)
    }
    else {
        return ""
    }
}


var result = longestRun("")
assert(result == "")

result = longestRun("x")
assert(result == "x")

result = longestRun("ab")
assert(result == "a")

result = longestRun("abb")
assert(result == "bb")

result = longestRun("abbb")
assert(result == "bbb")

result = longestRun("aaaabbb")
assert(result == "aaaa")

result = longestRun("adddbb")
assert(result == "ddd")

result = longestRun("adcc")
assert(result == "cc")

result = longestRun("xxxaddccyyyy")
assert(result == "yyyy")


