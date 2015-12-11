//
//  HangmanStart.swift
//  HangTheEvilMan
//
//  Created by Ezra Flowerdale on 10/12/15.
//  Copyright © 2015 elias bloemendaal. All rights reserved.
//

import Foundation

var goodNumber : Int = 0
var evilNumber : Int = 0
var valueLength : Int = 0
var valueLives : Int = 0
var lengthValue : Int = 0
var livesValue : Int = 0
var imgValue :Int = 0
var name : String?
var geussInput : String?
var randomWord : String?
var correctInput = String()
var CORRECTINPUT = String()
var DesiredLengthArray = [String]()
var randomNumber = 1
var geussedCharArray = [String]()
var characterAnswer: Array<Character> = Array(count: lengthValue , repeatedValue: "\t")
var codeWord = [Character]()

// Loads the wordlist
public class WordList {
    let wordlist = Words.sharedInstance.loadInstanceWords()
    public var wordList: NSArray = Words.sharedInstance.words!
}

// Create random word with desired length of the user
class GameMode {
    
    // Pick a random word and return the word
    func pickWord() -> String {
        
        // look for all the words in the dictionary with the length chosen by the user, give word back
        for index in WordList().wordList {
            
            let chosenWord: String? = index as? String
            let lengthWord = chosenWord!.characters.count
            
            // if the length of the word is desire length append to array
            if lengthWord == lengthValue {
                DesiredLengthArray.append(chosenWord!)
            }
            
            DesiredLengthArray.count
            randomNumber = Int(arc4random_uniform(UInt32(DesiredLengthArray.count)))
        }
        print(lengthValue)
        return DesiredLengthArray[randomNumber]
    }
    
    // Pick a random word and return the word
    func pickWords() -> Array<String> {
        
        // look for all the words in the dictionary with the length chosen by the user, give word back
        for index in WordList().wordList {
            
            let chosenWord: String? = index as? String
            let lengthWord = chosenWord!.characters.count
            
            // if the length of the word is desire length append to array
            if lengthWord == lengthValue {
                DesiredLengthArray.append(chosenWord!)
            }
        }
        return DesiredLengthArray
    }
    
    // change the word to similar characters
    func changeCodeword() -> Array<Character> {
        
        let wordLength = pickWord().characters.count
        let input = wordLength
        characterAnswer = Array(count: input, repeatedValue: "-")
        return characterAnswer
    }
    
    // append to the character array of the word
    func appendToCodeWord() -> Array<Character> {
        for i in randomWord!.characters{
            codeWord.append(i)
        }
        return codeWord
    }
    
    // check for lose
    func checkForLose() -> Bool {
        if (imgValue == 12) {
            return true
        }
        else if (livesValue <= 0) {
            return true
        }
        return false
    }
    
    // check for win
    func checkForWin() -> Bool {
        if characterAnswer.contains("-") {
            return false
        }
        else {
            return true
        }
    }
    
    func checkEVil() -> Bool {
        if evilNumber == 0 && goodNumber == 1  {
            return false
        }
        else {
            return true
        }
    }
    
    // check if alpha
    func alphaCheck(input: String) -> Bool {
        
        for char in input.utf8 {
            switch char {
            case 65...90:
                continue
            case 97...122:
                continue
            default:
                return false
            }
        }
        return true
    }
    
    // return a valid input otherwise give an error, rerturn good input or error
    func inputCheck(input: String) -> String {
        if input.characters.count > 1 {
            return "Just one character"
        }
        else if alphaCheck(input) == false {
            return "Just the latin alphabet a-z"
        }
        else if input == "" {
            return "You have to fill more in"
        }
        else {
            return input
        }
    }
    
    // second inputtcheck as boolean, return true when ok, otherwise false
    func inputtCheck(input: String) -> Bool {
        if input.characters.count > 1 {
            return false
        }
        else if alphaCheck(input) == false {
            return false
        }
        else if input == "" {
            return false
        }
        else {
            return true
        }
    }
    
    // Only append 1 alphabethic character and not the same character to the array
    func appendToArray(correctInput: String) -> Array<String>  {
        CORRECTINPUT = correctInput.uppercaseString
        if 0 < correctInput.characters.count && correctInput.characters.count < 2 {
            if geussedCharArray.contains(CORRECTINPUT) {
                print("is not possible")
            }
            else{
                geussedCharArray.append(CORRECTINPUT)
                return geussedCharArray
            }
        }
        return geussedCharArray
    }
    
}