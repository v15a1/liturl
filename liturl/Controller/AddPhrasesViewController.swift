//
//  AddPhrasesViewController.swift
//  liturl
//
//  Created by Visal Rajapakse on 6/18/20.
//  Copyright © 2020 Visal Rajapakse. All rights reserved.
//

import UIKit

class AddPhrasesViewController : UIViewController , UITextViewDelegate{
    
    @IBOutlet weak var addPhraseTextView: UITextField!
    var phrase : String?
    let dbHandler :DatabaseHandler = DatabaseHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Phrases"
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor(named: "BlueGrey")
        nav?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "LightBackground")!]
        
        let myPhrase = Phrase()
        myPhrase.phrase = "I am adding a phrase!"
        myPhrase.dateAdded = Date()
        
        dbHandler.addPhrases(myPhrase)
        //        addPhraseTextView.delegate = self
    }
    
}
