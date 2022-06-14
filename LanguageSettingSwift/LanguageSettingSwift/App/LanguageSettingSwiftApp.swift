//
//  LanguageSettingSwiftApp.swift
//  LanguageSettingSwift
//
//  Created by Yang on 7/6/2022.
//

import SwiftUI

@main
struct LanguageSettingSwiftApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LanguageSettings())
        }
    }
}
