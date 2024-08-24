//
//  PlaceAnnotation.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 18/08/2024.
//

import Foundation
import MapKit
import Contacts

class PlaceAnnotation: NSObject, MKAnnotation, Identifiable {
    
    let id = UUID()
    private var mapItem: MKMapItem
    
    init(mapItem: MKMapItem){
        self.mapItem = mapItem
    }
    
    var title: String? {
        mapItem.name
    }
    
    var phone: String {
        mapItem.phoneNumber ?? ""
    }
    
    var address: String {
        
        guard let postalAddress = mapItem.placemark.postalAddress else {
            return ""
        }
        
        return "\(postalAddress.street), \(postalAddress.city), \(postalAddress.state), \(postalAddress.postalCode)"
    }
    
    var coordinate: CLLocationCoordinate2D {
        mapItem.placemark.coordinate
    }
    
    var location: CLLocation? {
        return CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    
    func getDistance(userLocation: CLLocation?) -> Double? {
        
        guard let placeLocation = mapItem.placemark.location,
              let userLocation = userLocation else {
            return nil
        }
        
        return userLocation.distance(from: placeLocation)
    }
    
    
}
