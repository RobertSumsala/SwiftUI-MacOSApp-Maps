//
//  TroubleshootingScreen.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 20/08/2024.
//

import SwiftUI

struct TroubleshootingScreen: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("In case your location isn't displayed, try these few steps: ")
                .font(.title)
                .bold()
            Divider()
            Text("1. Go to -> System Settings -> Privacy & Security -> Location Services and allow the Maps app to access your location")
            Text("2. You have to be connected via WiFi, not an Ethernet cable")
            Text("3. Try restarting the app several times. (We are working on fixing this bug)")
        }.padding()
            .frame(minWidth: 780, minHeight: 270)
    }
}

#Preview {
    TroubleshootingScreen()
}
