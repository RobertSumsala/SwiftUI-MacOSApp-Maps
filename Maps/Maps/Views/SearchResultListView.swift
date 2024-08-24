//
//  SearchResultListView.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 17/08/2024.
//

import SwiftUI

struct SearchResultListView: View {
    
    let places: [PlaceAnnotation]
    var onSelect: (PlaceAnnotation) -> Void
    
    @StateObject private var locationManager = LocationManager()
    @AppStorage("distanceUnit") var distanceUnit: DistanceUnit = .kilometers
    
    private var distanceFormatter = DistanceFormatter()
    
    init(places: [PlaceAnnotation], onSelect: @escaping (PlaceAnnotation) -> Void) {
        self.places = places
        self.onSelect = onSelect
    }
    
    
    func formatDistance(for place: PlaceAnnotation) -> String {
        guard let distanceInMeters = place.getDistance(userLocation: locationManager.location)
        else { return "" }
        
        distanceFormatter.unitOptions = distanceUnit
        return distanceFormatter.format(distanceInMeters: distanceInMeters)
        
    }
    
    var body: some View {
        List(places) { place in
            VStack(alignment: .leading) {
                Text(place.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(formatDistance(for: place))
                    .font(.caption)
                    .opacity(0.4)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                onSelect(place)
            }
            
        }
    }
}

#Preview {
    SearchResultListView(places: [], onSelect: { _ in })
}
