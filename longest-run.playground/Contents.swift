/* 
The challenge here is to implement the longestRun function so that the
longest run of the same continuous character will be selected from a String.
This excercise lends itself to TDD and we have provided a few basic tests below.
*/

import Cocoa


func longestRun(whole: String) -> String {
    
    let longestRunString = recursion(whole, index: 0, lastCount: 0, maxLength: 0)
    
    return longestRunString.letters[0]
}

func longestRunAllSolutions(whole: String) -> Array<String> {
    
    let longestRunString = recursion(whole, index: 0, lastCount: 0, maxLength: 0)
    
    return longestRunString.letters
}

func recursion(word: String, index: Int, lastCount: Int, maxLength: Int) -> (maxLength: Int, letters: Array<String>) {
    var currentMax = maxLength
    var letters: [String] = []

    // Example why we should avoid ! as much as possible
//    guard let word = word else {
//        return (currentMax, letters)
//    }
    
    if word.isEmpty {
        return (0, [word])
    }
    
    let previousCharacter = word[word.startIndex.advancedBy(max(0, index - 1))]
    let currentCharacter = word[word.startIndex.advancedBy(index)]
    var currentCount = 1
    
    if previousCharacter == currentCharacter {
        currentCount = lastCount + 1
    }
    
    if currentCount > currentMax {
        currentMax = currentCount
    }
    
    
    if index < (word.characters.count - 1) {
        let result = recursion(word, index: index + 1, lastCount: currentCount, maxLength: currentMax)
        currentMax = result.maxLength
        letters = result.letters
    }
    
    // Coming back from recursion
    
    if currentCount == currentMax {
        let stringOfSameCharacter = stringWith(currentCharacter, repeated: currentMax)
        letters.insert(stringOfSameCharacter, atIndex: 0)
    }
    
    return (currentMax, letters)
}

func stringWith(character: Character, repeated: Int) -> (String)
{
    var string: String = ""
    for var i = 0; i < repeated; i++ {
        string.append(character)
    }
    
    return string
}

// identity test
var zzzz = "zzzz"
assert(zzzz == longestRun(zzzz), "\(zzzz) should be the longest run of chars")
assert([zzzz] == longestRunAllSolutions(zzzz), "[\(zzzz)] should be the longest run of chars")

// book
var book = "book"
assert("oo" == longestRun(book), "longest run in \(book) is 'oo'")
assert(["oo"] == longestRunAllSolutions(book), "longest run in \(book) is ['oo']")

// ooloo
var ooloo = "ooloo"
assert("oo" == longestRun(ooloo), "longest run in \(ooloo) is 'oo'")
assert(["oo", "oo"] == longestRunAllSolutions(ooloo), "longest run in \(ooloo) is ['oo','oo']")

// aaloo
var aaloo = "aaloo"
assert("aa" == longestRun(aaloo), "longest run in \(aaloo) is 'aa'")
assert(["aa", "oo"] == longestRunAllSolutions(aaloo), "longest run in \(aaloo) is ['aa','oo']")

// oolaalaa
var oolaalaa = "oolaalaa"
assert("oo" == longestRun(oolaalaa), "longest run in \(oolaalaa) is 'oo'")
assert(["oo", "aa", "aa"] == longestRunAllSolutions(oolaalaa), "longest run in \(oolaalaa) is ['oo','aa','aa']")

// ""
var emptyString = ""
assert("" == longestRun(emptyString), "longest run in \(emptyString) is 'oo'")
assert([""] == longestRunAllSolutions(emptyString), "longest run in \(emptyString) is []")

// optional (nil)
//var optional: String?
//assert("" == longestRun(optional!), "longest run in \(optional) is 'oo'")
//assert(["oo", "aa", "aa"] == longestRunAllSolutions(optional!), "longest run in \(optional) is []")


