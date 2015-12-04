//
//  PlayViewController.swift
//  HangTheEvilMan
//
//  Created by elias bloemendaal on 27/11/2015.
//  Copyright © 2015 elias bloemendaal. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var stringLabel: UILabel!
    @IBOutlet weak var GeussedCharacter: UILabel!
    @IBOutlet weak var GeussTextField: UITextField!
    @IBOutlet weak var NewGameButton: UIButton!
    @IBOutlet weak var GeussButton: UIButton!
    
    let wordsArray = ["jaap", "trekhaak", "hallo", "drol", "nee", "ja", "ok","struik", "het", "goed", "prima", "top", "ventiel", "belangrijk", "scooter", "hallohallohallo"]
    
    var answer: Array<Character> = Array(count: 10 , repeatedValue: "\t")
    
    var word: String?
    
    var charArray = [Character]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "minionsssss")!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 // self.FrontPageView.image = UIImage(named: "manFull")
    
    @IBAction func newGameButton(sender: AnyObject) {
        let singleWordInt = Int(arc4random_uniform(15))
        
        let randomWord = wordsArray[singleWordInt]
        
        let wordLength = randomWord.characters.count
        
        print(randomWord)
        
        answer = Array(count: wordLength, repeatedValue: "x")
        
        stringLabel.text = String(answer)
        
        NewGameButton.setTitle("New Game", forState: UIControlState.Normal)
    }
    

    @IBAction func GuessIt(sender: AnyObject) {
        
        var stringRepresentation : String?
        
        let char = GeussTextField.text!
        let searchCharacter: Character = char[char.startIndex]
        let charArray = Array(word!.characters)
        print (charArray)
        if charArray.contains(searchCharacter) {
            print (searchCharacter)
            let index : Int = charArray.indexOf(searchCharacter)!
            print (index)
            answer.removeAtIndex(index)
            answer.insert(searchCharacter, atIndex: index)
            print (answer)
            stringRepresentation = String(answer)
            print (stringRepresentation)
            stringLabel.text = stringRepresentation
        }
        
        if stringRepresentation == word {
            GeussedCharacter.text = "You won!"
        }
        self.GeussTextField.resignFirstResponder()
        GeussTextField.text = ""
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
