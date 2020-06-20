//
//  LanguageSubscriptionViewController.swift
//  liturl
//
//  Created by Visal Rajapakse on 6/20/20.
//  Copyright © 2020 Visal Rajapakse. All rights reserved.
//

import UIKit
import IBMSwiftSDKCore
import LanguageTranslator


class LanguageSubscriptionViewController: UIViewController, LanguageManagerDelegate {
    
    @IBOutlet weak var languagesTable: UITableView!
    var lanManager : LanguageManager = LanguageManager()
    var languages : [IdentifiableLanguage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Languages"
        let nav = navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor(named: "BlueGrey")
        nav?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "LightBackground")!]
        
        languagesTable.delegate = self
        languagesTable.dataSource = self
        lanManager.delegate = self
        lanManager.getLanguages()
    }
    
    func didUpdateUI(withArray langArray: [IdentifiableLanguage]) {
        DispatchQueue.main.async {
            print(langArray)
            self.languages = langArray
            self.languagesTable.reloadData()
        }
    }
}

class LanguageCell: UITableViewCell {
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var checkedButton: UIButton!
    
    var isChecked : Bool = false
    
    @IBAction func checkPressed(_ sender: UIButton) {
        if isChecked{
            if let image = UIImage(named: "unchecked.png"){
                checkedButton.setImage(image, for: .normal)
                isChecked = false
            }
        }else{
            if let image = UIImage(named: "checked.png"){
                checkedButton.setImage(image, for: .normal)
                isChecked = true
            }
        }
    }
}

extension LanguageSubscriptionViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.languageSubsCellID, for: indexPath) as! LanguageCell
        let language = languages[indexPath.row]
        cell.languageLabel.text = language.name
        cell.checkedButton.tag = indexPath.row
        return cell
    }
}




