//
//  DistanceUnit.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 20/08/2024.
//

import Foundation

enum DistanceUnit: String, Codable, CaseIterable {
    
    case miles
    case kilometers
    
}


extension DistanceUnit {
    var title: String {
        switch self {
            case .miles:
                return "mi"
            case .kilometers:
                return "km"
        }
    }
}
