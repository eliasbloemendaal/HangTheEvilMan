//
//  SettingsViewController.swift
//  HangTheEvilMan
//
//  Created by elias bloemendaal on 24/11/2015.
//  Copyright © 2015 elias bloemendaal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var lengthSlider: UISlider!
    @IBOutlet weak var livesSlider: UISlider!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var GameStyle: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var SafeSettingsButton: UIButton!
    var myImages = [UIImage]()
    let save = NSUserDefaults.standardUserDefaults()

    
    // Get an int from the lengthslide and save
    @IBAction func lengthSlide(sender: UISlider) {
        lengthValue = Int(sender.value)
        valueLength = Int(sender.value)
        save.setInteger(lengthValue, forKey: "LengthInt")
        lengthLabel.text = "Length: " + String(lengthValue)
    }
    
    // Get an int from the liveslide and save
    @IBAction func liveSlide(sender: UISlider) {
        livesValue = Int(sender.value)
        valueLives = Int(sender.value)
        save.setInteger(livesValue, forKey: "livesInt")
        livesLabel.text = "Lives: " + String(livesValue)
    }
    
    @IBAction func saveSettingButton(sender: AnyObject) {
        name = nameTextField.text
        save.setObject(name, forKey: "textFieldName")
        nameLabel.text = "Your name: " + String(name)
    }
    // When pressed evilbutton, a GIF converted to PNG will start
    @IBAction func evilButton(sender: AnyObject) {
        
        // when the images are animating or not, set titles
        if myImageView.isAnimating()
        {
            myImageView.stopAnimating()
            GameStyle.setTitle("Game Style: GOOD", forState: UIControlState.Normal)
            evilNumber = 0
            goodNumber = 1
        }
        else
        {
            myImageView.animationDuration = 1.4
            myImageView.startAnimating()
            GameStyle.setTitle("Game Style: EVIL", forState: UIControlState.Normal)
            evilNumber = 1
            goodNumber = 0

        }
    }

      override func viewDidLoad() {
        super.viewDidLoad()

        // lengthlabel updated with slider value
        lengthLabel.text = "Length: " + String(save.integerForKey("LengthInt"))
        lengthSlider.value = Float(save.integerForKey("LengthInt"))
        
        // lives label updated with slider value
        livesLabel.text = "Lives: " + String(save.integerForKey("livesInt"))
        livesSlider.value = Float(save.integerForKey("livesInt"))
        save.synchronize()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "minions")!)
        
        // Animation
        for i in 1...22
        {
            myImages.append(UIImage(named: "\(i)")!)
        }
        myImageView.animationImages = myImages
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
