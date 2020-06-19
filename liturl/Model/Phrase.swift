//
//  Phrase.swift
//  liturl
//
//  Created by Visal Rajapakse on 6/18/20.
//  Copyright © 2020 Visal Rajapakse. All rights reserved.
//

import Foundation
import RealmSwift

class Phrase : Object{
    @objc dynamic var phrase : String?
    @objc dynamic var dateAdded : Date?
}
