//
//  LanguageSettings.swift
//  LanguageSettingSwift
//
//  Created by Yang on 14/6/2022.
//

import Foundation

//: Constant
let systemLanguage = Locale.current.languageCode

//: Enumerations
enum lang : String, CaseIterable, Identifiable{
    case en, zh, ja
    var id: Self {self}
}

//: Class
class LanguageSettings: NSObject, ObservableObject {
    @Published var lang : lang
    
    override init(){
        if systemLanguage == "en"{
            self.lang = .en
        } else if systemLanguage == "zh" {
            self.lang = .zh
        } else {
            self.lang = .ja
        }
    }
}

// Extensions
extension String {
      func localizedStr(language:String) -> String {
          let path = Bundle.main.path(forResource: language, ofType: "lproj")
          let bundleName = Bundle(path: path!)
          return NSLocalizedString(self, tableName: nil, bundle: bundleName!, value: "", comment: "")
    }
}
