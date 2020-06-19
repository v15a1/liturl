//
//  DatabaseHandler.swift
//  liturl
//
//  Created by Visal Rajapakse on 6/18/20.
//  Copyright © 2020 Visal Rajapakse. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class DatabaseHandler{
    
    var realm : Realm
        
    init() {
        realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration)
    }
    
    //helper to add phrases to Realm
    func addPhrases(_ phrase : Phrase){
        try! realm.write{
            realm.add(phrase)
        }
    }
    
    }
