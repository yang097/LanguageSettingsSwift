//
//  TextRowView.swift
//  LanguageSettingSwift
//
//  Created by Yang on 14/6/2022.
//

import SwiftUI

struct TextRowView: View {
    
    @EnvironmentObject var selectedLang : LanguageSettings
    
    let texts : [String]
    
    // MARK: - BODY
    var body: some View {
        List{
            ForEach(texts, id:\.self) {text in
                Text(text.localizedStr(language: selectedLang.lang.rawValue))
            }
        }//: LIST
    }
}

struct TextRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        TextRowView(texts: ["Red", "Green", "Blue", "Brown", "Black", "Yellow"])
            .previewLayout(.sizeThatFits)
            .environmentObject(LanguageSettings())
    }
}
