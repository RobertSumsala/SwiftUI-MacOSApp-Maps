//
//  HomeScreen.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 17/08/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    @AppStorage("useLightMap") var useLightMap: Bool = false
    
    var body: some View {
        NavigationView {
            Group {
                SideBar()
                    .frame(minWidth: 280)
                MapScreen()
            }.preferredColorScheme(useLightMap ? .light : .dark)
        }
    }
}

#Preview {
    HomeScreen()
}
