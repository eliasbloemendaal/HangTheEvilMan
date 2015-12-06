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

    
    
    let wordsArray = ["jaap", "trekhaak", "hallo", "drol", "nee", "ja", "ok","struik", "het", "goed", "prima", "top", "ventiel", "belangrijk", "scooter", "hallohallohallo"]
    
    var codeWord = [Character]()
    var charsArray = [String]()
    var letter: String?
    var length : Int = 0
    var lengthCheck : Int = 0
    var answer: Array<Character> = Array(count: 10 , repeatedValue: "\t")
    var imgValue = 0


   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "minionsssss")!)
        hidden()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        

        // Do any additional setup after loading the view.

    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func DismissKeyboard(sender: AnyObject) {
        self.resignFirstResponder()
    }
    
    func textFieldDidChange() {
        letter = GeussedCharacter.text!
        letter = letter!.uppercaseString
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 // self.FrontPageView.image = UIImage(named: "manFull")
    
    @IBAction func newGameButton(sender: AnyObject) {
        
        imgValue = 0
        codeWord = []
        charsArray = []
        let randInt = Int(arc4random_uniform(15))
        let randomWord = wordsArray[randInt]
        let wordLength = randomWord.characters.count
        answer = Array(count: wordLength, repeatedValue: "-")
        
        for i in randomWord.characters
        {
            codeWord.append(i)
        }
    
        print(codeWord)
        
        GeussedCharacter.text = "Geussed Characters: "
        stringLabel.text = String(answer)
        NewGameButton.setTitle("New Game", forState: UIControlState.Normal)
        NewGameButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        hidden()
        
        

    }
    
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
    
    func check() {
        if GeussTextField.text == "" {
            print("You have to fill something in")
        }
        else if GeussTextField.text == String(charsArray) {
            "you have to fill something else in"
        }
        else
        {
            
        letter = GeussTextField.text
        var stringRepresentation : String?
        let searchCharacter: Character = letter![letter!.startIndex]
        let letter2 = Character(letter!)
        letter = GeussTextField.text
        charsArray.append(letter!)
        print(charsArray)
        GeussedCharacter.text! += " " + letter!
      
        if codeWord.contains(letter2) == true {
            var i = 0
            while i < codeWord.count {
                if codeWord[i] == searchCharacter {
                    answer.removeAtIndex(i)
                    answer.insert(searchCharacter, atIndex: i)
                    stringRepresentation = String(answer)
                    stringLabel.text = stringRepresentation
                    print (codeWord)
                    
                }
                i += 1
              }
            }
        else
        {
            
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
            stringLabel.text = "YOU LOSE"
            codeWord = []
        }
            imgValue += 1
        }
      }
    }
 
    // Create the method you want to call (see target before)
    func pressed(sender: UIButton!) {
        // do some stuff
        print("yourButton was pressed")
    }

    func lives() {
        
    }
    
    @IBAction func GuessIt(sender: AnyObject) {
        
        check()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
