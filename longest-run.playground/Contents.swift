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
    let characters = Array(whole.characters)
    if characters.count == 0 {
        return [""]
    }
    return doLongest(characters, currentRun: (char: characters.head()!, count: 0), accumulator: [])
}

func doLongest(characters: [Character], currentRun: (char: Character, count: Int), accumulator: [String]) -> [String] {
    if characters.isEmpty {
        return accumulator
    } else {
        let newCurrentRun: (char: Character, count: Int)
        if currentRun.char == characters.head()! {
            newCurrentRun = (currentRun.char, currentRun.count + 1)
        } else {
            newCurrentRun = (characters.head()!, 1)
        }
        let accumulatorElementLength = accumulator.isEmpty ? 0 : Array(accumulator[0].characters).count
        let currentExpandedRun = String([Character](count: newCurrentRun.count, repeatedValue: newCurrentRun.char))

        let newAccumulator: [String]
        if newCurrentRun.count < accumulatorElementLength {
            newAccumulator = accumulator
        } else if newCurrentRun.count == accumulatorElementLength {
            newAccumulator = accumulator + [currentExpandedRun]
        } else {
            newAccumulator = [currentExpandedRun]
        }
        return doLongest(characters.tail(), currentRun: newCurrentRun, accumulator: newAccumulator)
    }
}

assert([""] == longestRun(""), "empty string should return an array of empty string")
assert(["aa","bb"] == longestRun("aabb"), "should return non-empty")
assert(["aaa"] == longestRun("abbaaa"), "blah")
assert(["aaa", "bbb"] == longestRun("abbaaabbb"), "blah")
