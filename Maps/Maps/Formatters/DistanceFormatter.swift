//
//  DistanceFormatter.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 20/08/2024.
//

import Foundation

class DistanceFormatter {
    
    var unitOptions: DistanceUnit = .kilometers
    
    func format(distanceInMeters: Double) -> String {
        
        switch unitOptions {
            case .miles:
                return formatForMiles(distanceInMeters: distanceInMeters)
            case .kilometers:
                return formatForKilometers(distanceInMeters: distanceInMeters)
        }
        
    }
    
    
    private func formatForMiles(distanceInMeters: Double) -> String {
        switch distanceInMeters {
            case 0...182:
            return distanceInMeters.toFeet().displayDistance(.feet)
            case 183...:
            return distanceInMeters.toMiles().displayDistance(.miles)
            default:
                return distanceInMeters.toFeet().displayDistance(.feet)
        }
    }
    
    private func formatForKilometers(distanceInMeters: Double) -> String {
        switch distanceInMeters {
            case 0...900:
            return distanceInMeters.toMeters().displayDistance(.meters)
            case 901...:
            return distanceInMeters.toKms().displayDistance(.kilometers)
            default:
                return distanceInMeters.toMeters().displayDistance(.meters)
        }
    }
    
}
