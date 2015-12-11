//
//  PlayViewController.swift
//  HangTheEvilMan
//
//  Created by elias bloemendaal on 27/11/2015.
//  Copyright © 2015 elias bloemendaal. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var EvilOrNotEVilLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var yourInput: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stringLabel: UILabel!
    @IBOutlet weak var GeussedCharacter: UILabel!
    @IBOutlet weak var GeussTextField: UITextField!
    @IBOutlet weak var NewGameButton: UIButton!
    @IBOutlet weak var GeussButton: UIButton!
    @IBOutlet weak var minions: UIImageView!
    @IBOutlet weak var minions1: UIImageView!
    @IBOutlet weak var minions2: UIImageView!
    @IBOutlet weak var minions3: UIImageView!
    @IBOutlet weak var minions4: UIImageView!
    @IBOutlet weak var minions5: UIImageView!
    @IBOutlet weak var minions6: UIImageView!
    @IBOutlet weak var minions7: UIImageView!
    @IBOutlet weak var minions8: UIImageView!
    @IBOutlet weak var minions9: UIImageView!
    @IBOutlet weak var minions10: UIImageView!
    @IBOutlet weak var minions11: UIImageView!
    @IBOutlet weak var minions12: UIImageView!
    @IBOutlet weak var minions13: UIImageView!

    var GoodHangman = GoodHangmanCheck()
    var ModeGame = GameMode()
    var charsArray = [String]()
    var correctInput: String?
    var lengthCheck : Int = 0
    var characterAnswer: Array<Character> = Array(count: lengthValue, repeatedValue: "\t")
    var newElement : String?
    let saveLength = NSUserDefaults.standardUserDefaults()
    let saveScores = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidden()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "minionsssss")!)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        nameLabel.text = name
        livesLabel.text = String(livesValue)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Arrays will be set to nil and a newgame will start and picture's will be hidden
    @IBAction func newGameButton(sender: AnyObject) {
        imgValue = 0
        codeWord = []
        charsArray = []
        geussedCharArray = []
        DesiredLengthArray = []
        characterAnswer = []
        randomWord = GameMode().pickWord()
        print(randomWord)
        characterAnswer = ModeGame.changeCodeword()
        print(characterAnswer)
        codeWord = GameMode().appendToCodeWord()
        print ("peoepe")
        print(codeWord)
        GeussedCharacter.text = "Geussed Characters: "
        stringLabel.text = String(characterAnswer)
        NewGameButton.setTitle("New Game", forState: UIControlState.Normal)
        NewGameButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        hidden()
    }
    
    // Geuss function, checks input, append array, changes array, check for win and lose,
    @IBAction func GuessIt(sender: AnyObject) {
        
        if GameMode().checkEVil() == false {
            geussInput = GeussTextField.text
            correctInput = GameMode().inputCheck(geussInput!)
            yourInput.text = "Your input: " + correctInput!
            var newElement = String()
            
            // Create string for label
            for element in GameMode().appendToArray(correctInput!){
                 newElement += element
            }
            GeussedCharacter.text = "Geussed Character: " + newElement
            print(geussedCharArray)
            stringLabel.text = GoodHangmanCheck().gameProgress()
            switch imgValue {
            case 0:
                minions11.hidden = false
            case 1:
                minions8.hidden = false
            case 2:
                minions9.hidden = false
            case 3:
                minions13.hidden = false
            case 4:
                minions7.hidden = false
            case 5:
                minions6.hidden = false
            case 6:
                minions5.hidden = false
            case 7:
                minions4.hidden = false
            case 8:
                minions2.hidden = false
            case 9:
                minions3.hidden = false
            case 10:
                minions1.hidden = false
            case 11:
                minions10.hidden = false
            case 12:
                minions12.hidden = false
                minions.hidden = true
                minions1.hidden = true
                minions2.hidden = true
                minions3.hidden = true
                minions4.hidden = true
                minions5.hidden = true
                minions6.hidden = true
                minions7.hidden = true
                minions8.hidden = true
                minions9.hidden = true
                minions10.hidden = true
                minions11.hidden = true
                minions13.hidden = true
            default:
                codeWord = []
            }
            
            // Check for win
            if ModeGame.checkForLose() == true {
                stringLabel.text = "YOU LOSE "
                
            }
            
            // Check for lose
            if ModeGame.checkForWin() == true {
                stringLabel.text = "YOU HAVE WON"
                ModeGame.highscores()
                
            }
            livesLabel.text = String(livesValue)
        }
        else if GameMode().checkEVil() == true {
            geussInput = GeussTextField.text
            HangmanEvilCheck().evilMode()
            stringLabel.text = lastWord
            var newElement = String()
           
            // Create string for label
            for element in geussedCharArray {
                newElement += element
            }
            GeussedCharacter.text = "Geussed Character: " + newElement
            
            switch imgValue {
            case 0:
                minions11.hidden = false
                livesValue -= 1
            case 1:
                minions8.hidden = false
                livesValue -= 1
            case 2:
                minions9.hidden = false
                livesValue -= 1
            case 3:
                minions13.hidden = false
                livesValue -= 1
            case 4:
                minions7.hidden = false
                livesValue -= 1
            case 5:
                minions6.hidden = false
                livesValue -= 1
            case 6:
                minions5.hidden = false
                livesValue -= 1
            case 7:
                minions4.hidden = false
                livesValue -= 1
            case 8:
                minions2.hidden = false
                livesValue -= 1
            case 9:
                minions3.hidden = false
                livesValue -= 1
            case 10:
                minions1.hidden = false
                livesValue -= 1
            case 11:
                minions10.hidden = false
                livesValue -= 1
            case 12:
                minions12.hidden = false
                minions.hidden = true
                minions1.hidden = true
                minions2.hidden = true
                minions3.hidden = true
                minions4.hidden = true
                minions5.hidden = true
                minions6.hidden = true
                minions7.hidden = true
                minions8.hidden = true
                minions9.hidden = true
                minions10.hidden = true
                minions11.hidden = true
                minions13.hidden = true
            default:
                stringLabel.text = "YOU LOSE"
            }
            livesLabel.text = String(livesValue)
           
            // Check for win
            if ModeGame.checkForLose() == true {
                stringLabel.text = "YOU LOSE "
            }
            
            // Check for lose and ask for function highscore
            if ModeGame.checkForWinEvil() == true {
                stringLabel.text = "YOU HAVE WON"
                ModeGame.highscores()
            }
        }
        
    }
    
    // Hide the images
    func hidden(){
        minions.hidden = true
        minions1.hidden = true
        minions2.hidden = true
        minions3.hidden = true
        minions4.hidden = true
        minions5.hidden = true
        minions6.hidden = true
        minions7.hidden = true
        minions8.hidden = true
        minions9.hidden = true
        minions10.hidden = true
        minions11.hidden = true
        minions13.hidden = true
        minions12.hidden = true
    }

    // keyboard will dissapear
    func dismissKeyboard() {
        view.endEditing(true)
    }

    // keyboard will dissapear
    @IBAction func DismissKeyboard(sender: AnyObject) {
        self.resignFirstResponder()
    }
}
