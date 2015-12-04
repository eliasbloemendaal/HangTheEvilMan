//
//  HangManSwift.swift
//  HangTheEvilMan
//
//  Created by elias bloemendaal on 01/12/2015.
//  Copyright © 2015 elias bloemendaal. All rights reserved.
//

import Foundation
import UIKit



class Hangman {
    
    var lives = 0
    
    var guessedCharacters = [Character]()
    
    var guessedAnswer = " "
    
    var inProgress = true
    
    func inputCorrectGuesses() -> String {
        
        var correctGuesses = " "
        for char in guessedAnswer.characters{
            if (char == " ") {
                correctGuesses += " "
            }
            else {
                var charGuessed = false
                for guess in guessedCharacters {
                    if (char == guess){
                        charGuessed = true
                    }
                }
                if charGuessed {
                    correctGuesses += String(char) + " "
                }
                else{
                    correctGuesses += " "
                }
                
                }
                
            }
        return correctGuesses

        }
    
//    func checkTheLetter {
//        var salkdfj = 2
//    }
//    }
}

    
