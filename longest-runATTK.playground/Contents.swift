/* 
The challenge here is to implement the longestRun function so that the
longest run of the same continuous character will be selected from a String.
This excercise lends itself to TDD and we have provided a few basic tests below.
*/

import Cocoa

// Running time O(n) -> θ(1) if the string is empty and θ(n) otherwise
func longestRun(whole: String) -> (lenght: Int, strings:[String]) {
    
    // Move chars into an array
    let charArray = [Character](whole.characters)
    
    // Check if string is empty and return in case - θ(1)
    if charArray.count == 0 {
        return (charArray.count, [])
    }
    
    // We keep two variables to store the longest lenght and a char
    // for any substring with that lenght
    var longestLenght = -1
    var charsOfStringWithLongestLenght = [Character]()
    
    // We keep track of the lenght of the current substring and char
    // to be used while analysing the string in line
    var currentLenght = 1
    var currentCharacter = charArray[0]
    
    // We loop through each character - θ(n)
    for var i = 1; i <= charArray.count; i++ {
        var x: Character?
        
        //Step 1
        //Check if we reached the end of the string - in that case we only want to run Step 2
        if i < charArray.count {
            x = charArray[i]
            
            //If the character is equal to the previous we increase the number of the lenght of
            //the current substring and we move to the next loop
            if x == currentCharacter {
                currentLenght++
                continue
            }
        }
        
        //Step 2
        //We are at the start of a new substring, we need to check if the one just analysed is a new longest
        //and update our values accordingly
        if currentLenght == longestLenght {
            charsOfStringWithLongestLenght.append(currentCharacter)
        }
        else if currentLenght > longestLenght {
            longestLenght = currentLenght
            charsOfStringWithLongestLenght = [currentCharacter]
        }
        
        //Step 3
        //Reset the temp vars if we're not at the end of the string
        if let x = x {
            currentLenght = 1
            currentCharacter = x
        }
    }
    
    
    // We create actual strings using max lenght and chars O(n)
    var strings = [String]()
    for char in charsOfStringWithLongestLenght {
        var string = ""
        for var i = 0; i < longestLenght; i++ {
            string += "\(char)"
        }
        strings.append(string)
    }
    
    return (longestLenght, strings)
}

// identity test
var zzzz = "zzzz"
let test1 = longestRun(zzzz)
assert(test1.lenght == 4)
assert(test1.strings == ["zzzz"])

var abcccdddbg = "abcccdddbg"
let test2 = longestRun(abcccdddbg)
assert(test2.lenght == 3)
assert(test2.strings == ["ccc", "ddd"])

var empty = ""
let test3 = longestRun(empty)
assert(test3.lenght == 0)
assert(test3.strings == [])

var a = "a"
let test4 = longestRun(a)
assert(test4.lenght == 1)
assert(test4.strings == ["a"])

var bbbccctttthhttttjhdbbbbjjshd = "bbbccctttthhttttjhdbbbbjjshd"
let test5 = longestRun(bbbccctttthhttttjhdbbbbjjshd)
assert(test5.lenght == 4)
assert(test5.strings == ["tttt", "tttt", "bbbb"])
