//
//  AppState.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 18/08/2024.
//

import Foundation

class AppState: ObservableObject {
    
    @Published var places: [PlaceAnnotation] = []
    @Published var selectedPlace: PlaceAnnotation?
    
}
