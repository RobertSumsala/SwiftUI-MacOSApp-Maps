//
//  MapsApp.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 17/08/2024.
//

import SwiftUI

@main
struct MapsApp: App {
    var body: some Scene {
        WindowGroup {
            
            let appState = AppState()
            
            HomeScreen()
                .frame(minWidth: 1280, minHeight: 720)
                .environmentObject(appState)
        }.commands {
            CommandGroup(after: .appInfo) {
                Divider()
                Button("Preferences" ) {
                    PreferenceScreen()
                        .openInWindow(title: "Preferences", sender: self)
                }
                Button("Troubleshooting") {
                    TroubleshootingScreen()
                        .openInWindow(title: "Troubleshooting", sender: self)
                }
            }
        }
    }
}
