//
//  SideBar.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 17/08/2024.
//

import SwiftUI

struct SideBar: View {
    
    private var vm = SearchResultsViewModel()
    @State private var search: String = ""
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            SearchResultListView(places: appState.places) { place in
                appState.selectedPlace = place
                print(place)
            }
        }.searchable(text: $search, placement: .sidebar, prompt: "Search maps")
            .onChange(of: search, {
                vm.search(text: search, completion: { places in
                    appState.places = places
                })
            })
            .padding()

    }
}

#Preview {
    SideBar()
}
