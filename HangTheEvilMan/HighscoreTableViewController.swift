//
//  HighscoreTableViewController.swift
//  HangTheEvilMan
//
//  Created by Ezra Flowerdale on 11/12/15.
//  Copyright © 2015 elias bloemendaal. All rights reserved.
//
import Foundation
import UIKit

    class HighscoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        let save = NSUserDefaults.standardUserDefaults()
        var highscoreArray = [String]()
        
        
        @IBOutlet weak var tableView: UITableView!
        override func viewDidLoad() {
            
            highscoreArray = save.arrayForKey("myArray") as! Array<String>
            tableView.reloadData()
        }
        

        // the value of rows will be presented
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return highscoreArray.count
        }
        
        // sectionss
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        
        // list of highscores
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
            let myArray = savedHighScore.objectForKey("myArray")
            
            print (highscoreArray)
            cell.textLabel!.text = String(myArray![indexPath.row])
            save.setObject(highscoreArray as Array<String>, forKey: "scores")
            
            return cell
        }
        
}


