//
//  SettingView.swift
//  LanguageSettingSwift
//
//  Created by Yang on 14/6/2022.
//

import SwiftUI

struct SettingView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var selectedLang : LanguageSettings
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - SECTION 2
                    GroupBox(
                        label:
                            HStack {
                              Text("Language Setting".uppercased()).fontWeight(.bold)
                              Spacer()
                              Image(systemName: "info.circle")
                            }
                    ){
                        Divider().padding(.vertical,4)
                        
                        Picker("Language", selection: $selectedLang.lang) {
                            Text("ENG").tag(lang.en)
                            Text("ZH").tag(lang.zh)
                            Text("JPN").tag(lang.ja)
                        }
                        .pickerStyle(.segmented)
                        
                        Divider().padding(.vertical, 4)
                        
                    }
                    
                
                } //: VSTACK
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action:{
                            presentationMode.wrappedValue.dismiss() 
                        }) {
                            Image(systemName: "xmark")
                        }
                )
                .padding()
            } //: SCROLL
        } //: NAVIGATION
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(LanguageSettings())
    }
}
