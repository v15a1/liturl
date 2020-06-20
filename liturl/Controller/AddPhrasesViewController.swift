//
//  AddPhrasesViewController.swift
//  liturl
//
//  Created by Visal Rajapakse on 6/18/20.
//  Copyright © 2020 Visal Rajapakse. All rights reserved.
//

import UIKit

class AddPhrasesViewController : UIViewController, UITextFieldDelegate{
    
    var phrase : String?
    let dbHandler :DatabaseHandler =
        DatabaseHandler()
    var phrasesInDB : [Phrase] = []
    
    @IBOutlet weak var addPhraseTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Phrases"
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor(named: "BlueGrey")
        nav?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "LightBackground")!]
        
        addPhraseTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    @IBAction func addPhrasePressed(_ sender: Any) {
        if let phrase = addPhraseTextField.text, addPhraseTextField.text != ""{
            if !dbHandler.checkDuplicate(checkDuplicateOf: phrase) {
                //adding a phrase to the DB
                let dbPhrase = Phrase()
                dbPhrase.dateAdded = Date()
                dbPhrase.phrase = phrase
                dbHandler.addPhrases(dbPhrase)
            }else{
                print("duplicates found")
            }
        }else{
            //MARK :- Display error
            print("failed to add items")
        }
    }
}
