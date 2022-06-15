//
//  ContentView.swift
//  LanguageSettingSwift
//
//  Created by Yang on 7/6/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var selectedLang : LanguageSettings
    
    @State private var isShowingSettings: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(spacing: 10){
                Picker("Language", selection: $selectedLang.lang) {
                    Text("ENG").tag(lang.en)
                    Text("ZH").tag(lang.zh)
                    Text("JPN").tag(lang.ja)
                }
                .padding()
                .pickerStyle(.segmented)
                
                Text("System Language: " + String(systemLanguage!))
                Text("Current Language: " + selectedLang.lang.rawValue)
                
                TextRowView(texts: texts).environmentObject(selectedLang)
            }//: VSTACK
            .navigationTitle("Languages")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    } //: BUTTON
                    .sheet(isPresented: $isShowingSettings) {
                        SettingView().environmentObject(selectedLang)
                    }
            )
        }//: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LanguageSettings())
    }
}
