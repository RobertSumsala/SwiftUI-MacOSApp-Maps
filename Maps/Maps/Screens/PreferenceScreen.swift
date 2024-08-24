//
//  PreferenceScreen.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 20/08/2024.
//

import SwiftUI

struct PreferenceScreen: View {
    
    @AppStorage("useLightMap") var useLightMap: Bool = false
    @AppStorage("distanceUnit") var distanceUnit = DistanceUnit.kilometers
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            Toggle(isOn: $useLightMap) {
                Text("Use light mode")
            }
            
            Divider()
            
            HStack {
                Text("Distance units")
                Picker("", selection: $distanceUnit) {
                    ForEach(DistanceUnit.allCases, id: \.self) { distance in
                        Text(distance.title)
                    }
                }.fixedSize()
                    .padding(.trailing, 20)
            }
        }.padding()
            .frame(minWidth: 400, minHeight: 400)
    }
}

#Preview {
    PreferenceScreen()
}
