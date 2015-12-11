//
//  HangmanEvilCheck.swift
//  HangTheEvilMan
//
//  Created by Ezra Flowerdale on 10/12/15.
//  Copyright © 2015 elias bloemendaal. All rights reserved.
//

import Foundation


public var evilWordsArray: [String] = []
public var final = ""
var wordRepresentation = [Character]()
public var arrayInt = 0
var leftOverWordsArray = GameMode().pickWords()
var leftWordArray = leftOverWordsArray

class HangmanEvilCheck {
    
    var evilValue = 0
    
        func evilMode() {
        
        var x = 0
    
        // Append element to leftWordArray with the good length
        for element in leftWordArray {
            
            let temporaryWord: String? = element
            let WordLength = temporaryWord!.characters.count
            
            // l
            if lengthValue != WordLength {
                
                leftWordArray.removeAtIndex(x)
                x = x - 1
            }
            x = x + 1
        }
        
        // Check if input is correct
        if GameMode().inputtCheck(geussInput!) == true {
        let letter = (Character(geussInput!.uppercaseString))
        
        print (letter)
        
        var keyWithWordsDict = [String: [String]]()
        var keyOfBiggestArray = ""
        
        for word in leftWordArray {
            
            var wordKey = ""
            
            for character in word.characters {
                
                if String(character) == String(letter) {
                    
                    wordKey = wordKey + String(letter)
                }
                else {
                    
                    wordKey = wordKey + "*"
                }
            }
            
            if keyWithWordsDict[wordKey] == nil {
                
                keyWithWordsDict[wordKey] = [word]
            }
            else {
                
                keyWithWordsDict[wordKey]!.append(word)
            }
        }
        
        print (keyWithWordsDict)
        print ("einde xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
        
        var keyOfBiggestArrayCount = 0
        
        for key in keyWithWordsDict.keys {
            
            var valueCount = 0
            
            for value in keyWithWordsDict[key]! {
                
                valueCount = valueCount + 1
            }
            
            if valueCount > keyOfBiggestArrayCount {
                
                keyOfBiggestArrayCount = valueCount
                keyOfBiggestArray = key
            }
        }
            
        evilValue = 0
        
        leftWordArray.removeAll()
        leftWordArray = keyWithWordsDict[keyOfBiggestArray]!
        
        print ("oooooooooooooooooooo")
        print (leftWordArray)
        
        let afterCheckCount = leftWordArray.count
        
        
        for index in leftWordArray {
            
            let currentWord: String? = index
            let currentWordArray = Array(currentWord!.characters)
            
            if currentWordArray.contains(letter) {
                
                evilValue = evilValue + 1
            }
        }
        
        if arrayInt == 0 {
            
            for var index = 0; index < lengthValue; ++index {
                
                wordRepresentation.append("*")
                
            }
            arrayInt = arrayInt + 1
        }
        
        print (evilValue)
        print(afterCheckCount)
        if evilValue == afterCheckCount {
            
            
            var y = 0
            let biggestKeyArray = Array(keyOfBiggestArray.characters)
            
            for index in biggestKeyArray {
                
                if index != "*" {
                    wordRepresentation.removeAtIndex(y)
                    wordRepresentation.insert(index, atIndex: y)
                }
                y = y + 1
                
            }
            
        }
        print (wordRepresentation)
        print (keyOfBiggestArray)
        
        final = String(wordRepresentation)
        
    }
    }
}