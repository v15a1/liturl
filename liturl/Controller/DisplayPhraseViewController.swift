//
//  DisplayPhraseViewController.swift
//  liturl
//
//  Created by Visal Rajapakse on 6/20/20.
//  Copyright © 2020 Visal Rajapakse. All rights reserved.
//

import Foundation
import UIKit

class DisplayPhraseViewController : UIViewController, UITableViewDelegate{
    
    let dbHandler : DatabaseHandler = DatabaseHandler()
    var savedPhrases : [Phrase]?
    @IBOutlet weak var displayPhrasesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Phrases"
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor(named: "BlueGrey")
        nav?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "LightBackground")!]
        
        displayPhrasesTable.delegate = self
        displayPhrasesTable.dataSource = self
        savedPhrases = dbHandler.getPhrases()
    }
}

extension DisplayPhraseViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedPhrases?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.displayPhraseCellID)
        if let dbPhrases = savedPhrases{
            cell?.textLabel?.text = dbPhrases[indexPath.row].phrase
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            cell?.detailTextLabel?.text = dateFormatter.string(from: dbPhrases[indexPath.row].dateAdded ?? Date())
        }
        return cell!
    }
}
