//
//  Measurement+Extensions.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 20/08/2024.
//

import Foundation
import CoreLocation

enum DisplayDistanceUnit {
    case feet
    case meters
    case miles
    case kilometers
}

extension Measurement where UnitType: UnitLength {
     
    func displayDistance(_ unit: DisplayDistanceUnit) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        
        switch unit {
            case .feet, .meters:
                formatter.numberFormatter.maximumFractionDigits = 0
            case .miles, .kilometers:
                formatter.numberFormatter.maximumFractionDigits = 1
        }
        
        return formatter.string(from: self)
    }
    
}


extension CLLocationDistance {
    
    func toFeet() -> Measurement<UnitLength> {
        let valueInMeters = Measurement(value: self, unit: UnitLength.meters)
        return valueInMeters.converted(to: .feet)
    }
    
    func toMeters() -> Measurement<UnitLength> {
        let valueInMeters = Measurement(value: self, unit: UnitLength.meters)
        return valueInMeters
    }
    
    func toMiles() -> Measurement<UnitLength> {
        let valueInMeters = Measurement(value: self, unit: UnitLength.meters)
        return valueInMeters.converted(to: .miles)
    }
    
    func toKms() -> Measurement<UnitLength> {
        let valueInMeters = Measurement(value: self, unit: UnitLength.meters)
        return valueInMeters.converted(to: .kilometers)
    }
    
}
