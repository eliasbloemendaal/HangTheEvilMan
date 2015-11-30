//
//  SettingsViewController.swift
//  HangTheEvilMan
//
//  Created by elias bloemendaal on 24/11/2015.
//  Copyright © 2015 elias bloemendaal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    var myImages = [UIImage]()
   
    @IBOutlet weak var EvilNotEvil: UIButton!
    
    @IBAction func evilButton(sender: AnyObject) {
        
        if myImageView.isAnimating()
        {
            myImageView.stopAnimating()
            EvilNotEvil.setTitle("Not Evil", forState: UIControlState.Normal)
        }
        else
        {
            myImageView.animationDuration = 1.4
            myImageView.startAnimating()
            EvilNotEvil.setTitle("EVIL", forState: UIControlState.Normal)
        }
    }

    
      override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "minions")!)
        
        for i in 1...22
        {
            myImages.append(UIImage(named: "\(i)")!)
        }
        myImageView.animationImages = myImages
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func DismissKeyboard(sender: AnyObject) {
        self.resignFirstResponder()
    }
    
    @IBAction func DismissKeyboardtwo(sender: AnyObject) {
        self.resignFirstResponder()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
    }


}
