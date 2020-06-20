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
            print("phrases added")
        }
    }
    
    //helper to get phrases
    func getPhrases() -> [Phrase]{
        var phrases : [Phrase] = []
        let dbPhrasesList = realm.objects(Phrase.self)
        for phrase in dbPhrasesList{
            phrases.append(phrase)
        }
        return phrases
    }
    
    func checkDuplicate(checkDuplicateOf phraseToCheck : String) -> Bool {
        let dbPhraseList = realm.objects(Phrase.self)
        for phrase in dbPhraseList{
            if (phrase.phrase?.contains(phraseToCheck))!{
                return true
            }
        }
        return false
    }
}
