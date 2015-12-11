//
//  HangmanEvilCheck.swift
//  HangTheEvilMan
//
//  Created by Ezra Flowerdale on 10/12/15.
//  Copyright © 2015 elias bloemendaal. All rights reserved.
//

import Foundation


public var evilWordsArray: [String] = []
public var lastWord = ""
var codeWordCharacters = [Character]()
public var intCount = 0
var leftOverWordsArray = GameMode().pickWords()
var leftWordArray = leftOverWordsArray

class HangmanEvilCheck {
    
    var evilValue = 0
    
        func evilMode() {
        var indexInt = 0
    
        // Append element to leftWordArray with the good length
        for element in leftWordArray {
            
            let temporaryWord: String? = element
            let WordLength = temporaryWord!.characters.count
            
            // the input of the user's length int
            if lengthValue != WordLength {
                leftWordArray.removeAtIndex(indexInt)
                indexInt -= 1
            }
            indexInt += 1
        }
        
        // Check if input is correct
        if GameMode().inputtCheck(geussInput!) == true {
        let char = (Character(geussInput!.uppercaseString))
        geussedCharArray.append(String(char))
        print (char)
        var keyWordDict = [String: [String]]()
        var keyLargestArray = ""
        
        // First for loop, to iterate over all the word in the array
        for singleWord in leftWordArray {
            
            var keys = ""
            
            // iterrate over characters in singleword
            for character in singleWord.characters {
                
                 // creat & replace key with characters "-" for not search characters, otherwise the character will be filled in
                if String(character) == String(char) {
                    
                    keys += String(char)
                }
                else {
                    keys += "-"
                }
            }
            
            // if the Dictionary is empty, the first word will be created, if not empty singleword will ben append to dict
            if keyWordDict[keys] == nil {
                
                keyWordDict[keys] = [singleWord]
            }
            else {
                
                keyWordDict[keys]!.append(singleWord)
            }
        }

        var intLargestArray = 0
        // check all the keys
        for key in keyWordDict.keys {
            
            var intCountingValue = 0
            
            // check how many word in the dictionary at the key position
            for value in keyWordDict[key]! {
    
                intCountingValue += 1
            }
            
            // swap the largest counting value to intlargestArray
            if intCountingValue > intLargestArray {
                intLargestArray = intCountingValue
                keyLargestArray = key
            }
        }
            
        leftWordArray = []
        evilValue = 0
        leftWordArray = keyWordDict[keyLargestArray]!

        let afterCheckCount = leftWordArray.count
        
            // iterate over the last largest array
        for index in leftWordArray {
            
            let temporaryWord: String? = index
            let currentWordArray = Array(temporaryWord!.characters)
            
            // counts the words containing the search character
            if currentWordArray.contains(char) {
                evilValue += 1
            }
        }
        
        // create code word with the "-" character
        if intCount == 0 {
            
            // create code word with the "-" character
            for var index = 0; index < lengthValue; ++index {
                
                codeWordCharacters.append("-")
            }
            intCount += 1
        }

            
        // if the value is the last value give a character
        if evilValue == afterCheckCount {
            
            var y = 0
            let largestKeyArray = Array(keyLargestArray.characters)
            
            // replace
            for index in largestKeyArray {
                
                if index != "-" {
                    codeWordCharacters.removeAtIndex(y)
                    codeWordCharacters.insert(index, atIndex: y)
                }
                y += 1
                imgValue -= 1
                livesValue += 1
            }
        }
        imgValue += 1
        lastWord = String(codeWordCharacters)
    }
    }
}