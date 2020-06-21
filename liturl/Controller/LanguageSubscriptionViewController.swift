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
    var subsLanguages : [Language] = []
    let dbHandler : DatabaseHandler = DatabaseHandler()
    static var checkedLanguageIndexes : [Int] = []
    
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
        subsLanguages = dbHandler.getSubscribedLanguages()
        
        for lan in subsLanguages{
            LanguageSubscriptionViewController.checkedLanguageIndexes.append(lan.languageIndex)
        }
    }
    
    @IBAction func updatePressed(_ sender: Any) {
        print("Updating subscriptions")
        dbHandler.deleteSubscribedLanguages()
        for index in LanguageSubscriptionViewController.checkedLanguageIndexes {
            let language : Language = Language()
            language.languageIndex = index
            language.languageName = languages[index].name
            language.languageAbbr = languages[index].language
            dbHandler.addSubscribedLanguages(language)
        }
    }
    
    func didUpdateUI(withArray langArray: [IdentifiableLanguage]) {
        DispatchQueue.main.async {
            self.languages = langArray
            self.languagesTable.reloadData()
            print("reloaded data" )
        }
    }
}

class LanguageCell: UITableViewCell {
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var checkedButton: UIButton!
    @IBOutlet weak var languageAbbrLabel: UILabel!
    
    var isChecked : Bool = false
    
    @IBAction func checkPressed(_ sender: UIButton) {
        let checkedItem = checkedButton.tag
        if isChecked{
            if let image = UIImage(named: "unchecked.png"){
                checkedButton.setImage(image, for: .normal)
                isChecked = false
                if let foundIndex = LanguageSubscriptionViewController.checkedLanguageIndexes.firstIndex(of: checkedItem){
                    LanguageSubscriptionViewController.checkedLanguageIndexes.remove(at: foundIndex)
                }
                
            }
        }else{
            if let image = UIImage(named: "checked.png"){
                checkedButton.setImage(image, for: .normal)
                isChecked = true
                LanguageSubscriptionViewController.checkedLanguageIndexes.append(checkedItem)
            }
        }
        
        print(LanguageSubscriptionViewController.checkedLanguageIndexes)
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
        cell.languageAbbrLabel.text = language.language
        cell.checkedButton.tag = indexPath.row
        for subscribedLan in subsLanguages{
            if subscribedLan.languageIndex == indexPath.row{
                print("\(subscribedLan.languageName) is checked")
                cell.isChecked = true
                if let image = UIImage(named: "checked.png"){
                    cell.checkedButton.setImage(image, for: .normal)
                    cell.isChecked = true
                }
                break
            }
        }
        return cell
    }
}




