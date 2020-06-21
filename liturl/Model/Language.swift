//
//  Language.swift
//  liturl
//
//  Created by Visal Rajapakse on 6/20/20.
//  Copyright © 2020 Visal Rajapakse. All rights reserved.
//

import UIKit
import RealmSwift

class Language : Object{
    @objc dynamic var languageIndex : Int = -1
    @objc dynamic var languageName : String = ""
    @objc dynamic var languageAbbr : String = ""
}

