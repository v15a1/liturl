//
//  DatabaseHandler.swift
//  liturl
//
//  Created by Visal Rajapakse on 6/18/20.
//  Copyright © 2020 Visal Rajapakse. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseHandler{
    
    var realm : Realm
    
    init() {
        realm = try! Realm()
//        print(Realm.Con)
    }
}
