//
//  ViewController.swift
//  liturl
//
//  Created by Visal Rajapakse on 6/17/20.
//  Copyright © 2020 Visal Rajapakse. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class HomeViewController: UIViewController {

    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var addPhrasesButton: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setButtonView()
        
        let config = Realm.Configuration(
          schemaVersion: 1
          )
        Realm.Configuration.defaultConfiguration = config
        
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration)
        
//        var myPhrase = Phrase()
//        myPhrase.phrase = "I am great!"
//        myPhrase.dateAdded = Date()
//        
//        try! realm.write{
//            realm.add(myPhrase)
//        }
    }
    
    @IBAction func pressedAddPhrases(_ sender: UIButton) {
//        performSegue(withIdentifier: KSegue.addPhrasesId, sender: self)
    }
    
    @IBAction func pressedDisplayPhrases(_ sender: Any) {
    }
    
    @IBAction func pressedEditPhrases(_ sender: Any) {
    }
    
    @IBAction func pressedLanguageSubscription(_ sender: Any) {
    }
    
    @IBAction func pressedTranslate(_ sender: Any) {
    }
}

extension HomeViewController{
    func setBackground(){
        if let bgImage = UIImage(named: "language" ){
            let bgImageView = UIImageView(frame: self.view.frame)
            bgImageView.image = bgImage
            bgImageView.contentMode = .scaleAspectFill
            bgImageView.alpha = 0.3
            self.view.insertSubview(bgImageView, at: 0)
        }
    }
    
    
    func setButtonView(){
        buttonView.layer.cornerRadius = 10
    }
}

