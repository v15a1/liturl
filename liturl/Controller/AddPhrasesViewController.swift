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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Phrases"
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor(named: "BlueGrey")
        nav?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "LightBackground")!]
        
//        addPhraseTextView.delegate = self
    }
    
}
