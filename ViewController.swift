//
//  ViewController.swift
//  Silly Song
//
//  Created by Sukriku on 26/09/2017.
//  Copyright © 2017 Vedarth Solutions. All rights reserved.
//

import UIKit

// join an array of strings into a single template string:
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortenName(fullName: String) -> String {
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    let lowercaseName = fullName.lowercased()
    
    if let index = lowercaseName.rangeOfCharacter(from: vowelSet)?.lowerBound {
        return lowercaseName.substring(from: index)
    }
    return fullName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    return bananaFanaTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortenName(fullName: fullName))
}

class ViewController: UIViewController {

   
    
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var songTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameTextField.text = ""
        songTextView.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
        songTextView.text! = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameTextField.text!)
        
    }
}

