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
    
    // MARK: - FUNCTIONS
    func currentLang() -> String {
        if selectedLang.lang == .en{
            return "ENG"
        } else if selectedLang.lang == .fr {
            return "FR"
        } else {
            return "IT"
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(spacing: 10){
                Picker("Language", selection: $selectedLang.lang) {
                    Text("ENG").tag(lang.en)
                    Text("FR").tag(lang.fr)
                    Text("IT").tag(lang.it)
                }
                .padding()
                .pickerStyle(.segmented)
                
                Text("Current Language: " + currentLang())
                
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
