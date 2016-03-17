/* 
The challenge here is to implement the longestRun function so that the
longest run of the same continuous character will be selected from a String.
This excercise lends itself to TDD and we have provided a few basic tests below.
*/

import Cocoa

extension Array {
    func tail() -> Array {
        if count > 1 {
            return Array(self[1...count-1])
        } else {
            return []
        }
    }

    func head() -> Array.Element? {
        if count > 0 {
            return self[0]
        } else {
            return nil
        }

    }
}

func longestRun(whole: String) -> [String] {
    func convert(characters: [Character], count: Int) -> [String] {
        return characters.map({(character: Character) -> String in String([Character](count: count, repeatedValue: character))})
    }

    let characters = Array(whole.characters)
    if characters.count == 0 {
        return [""]
    }
    let result = doLongest(characters.tail(), currentRunCharacter: characters.head(), currentRunCount: 1, longestRunCharacters: [characters.head()], longestRunCount: 1)
    return convert(result.characters, count: result.count)
}

func doLongest(characters: [Character], currentRunCharacter: Character, currentRunCount: Int, longestRunCharacters: [Character], longestRunCount: Int)

    -> (characters: [Character], count: Int) {

}

assert([""] == longestRun(""), "empty string should return an array of empty string")
assert(["aa","bb"] == longestRun("aabb"), "should return non-empty")

