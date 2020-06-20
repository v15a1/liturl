//
//  LanguageManager.swift
//  liturl
//
//  Created by Visal Rajapakse on 6/21/20.
//  Copyright © 2020 Visal Rajapakse. All rights reserved.
//

import Foundation
import LanguageTranslator

protocol LanguageManagerDelegate {
    func didUpdateUI(withArray langArray : [IdentifiableLanguage])
}

struct LanguageManager {
    
    var delegate : LanguageManagerDelegate?
    
    func getLanguages(){
        let authenticator = WatsonIAMAuthenticator(apiKey: Constants.translatorAPIKey)
        let languageTranslator = LanguageTranslator(version: "2018-05-01", authenticator: authenticator)
        languageTranslator.serviceURL = Constants.translatorURL
                languageTranslator.listIdentifiableLanguages() {
          response, error in

          guard let languagesList = response?.result else {
            print(error?.localizedDescription ?? "unknown error")
            return
          }
                    
            self.delegate!.didUpdateUI(withArray: languagesList.languages)
        }
    }
}
