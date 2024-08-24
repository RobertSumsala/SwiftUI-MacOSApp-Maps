//
//  MapScreen.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 17/08/2024.
//

import SwiftUI

struct MapScreen: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        MapView(annotations: appState.places, selectedPlace: appState.selectedPlace)
    }
}

#Preview {
    MapScreen()
}
