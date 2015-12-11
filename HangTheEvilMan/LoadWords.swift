//
//  LoadWords.swift
//  HangTheEvilMan
//
//  Created by Ezra Flowerdale on 09/12/15.
//  Copyright © 2015 elias bloemendaal. All rights reserved.
//

import Foundation



public class Words {
    
    public static let sharedInstance = Words()
    public var words: Array<String>?
    private init() {}
    
    public func loadInstanceWords () {
        if (self.words == nil) {
            self.words = loadText()
        }
    }
    
    private func loadText() -> Array<String> {
        
        do {
            let filePath = NSBundle.mainBundle().pathForResource("words", ofType: "plist")
            return NSArray(contentsOfFile: filePath!) as! [String]
        }
        catch {
            print ("error occured in loadText function")
        }
        
    }
}