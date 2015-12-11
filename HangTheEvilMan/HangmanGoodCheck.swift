//
//  HangManSwift.swift
//  HangTheEvilMan
//
//  Created by elias bloemendaal on 01/12/2015.
//  Copyright © 2015 elias bloemendaal. All rights reserved.
//

import Foundation
import UIKit

let save = NSUserDefaults.standardUserDefaults()

class GoodHangmanCheck {
    // Return the geussedcharacter in array to string
    func returnString() -> String {
        var newElement = String()
        for element in GameMode().appendToArray(CORRECTINPUT) {
            newElement += element
        }
        return "Geussed character: " + newElement
    }
    
    // Game progress,input will be checked, variables will change and the answer will be updated
    func gameProgress() ->String{
        let letter = geussInput
        let LETTER = letter?.uppercaseString
        if GameMode().inputtCheck(LETTER!) == true {
        var changingString : String?
        let searchCharacter: Character = LETTER![LETTER!.startIndex]
        let letterChar = Character(LETTER!)
        
        // if the word contains the searchCharacter replace
        if codeWord.contains(letterChar) == true {
            var x = 0
            while x < codeWord.count {
                if codeWord[x] == searchCharacter {
                    characterAnswer.removeAtIndex(x)
                    characterAnswer.insert(searchCharacter, atIndex: x)
                    changingString = String(characterAnswer)

                            }
                    x += 1
                    }
        }
        else
        {
            imgValue += 1
            livesValue -= 1
        }
            return String(characterAnswer)
        }
        return ""
        
    }

}