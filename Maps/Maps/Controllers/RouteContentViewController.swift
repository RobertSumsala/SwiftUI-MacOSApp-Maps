//
//  RouteContentViewController.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 20/08/2024.
//

import Foundation
import AppKit
import MapKit

class RouteContentViewController: NSViewController {
    
    private var route: MKRoute
    
    init(route: MKRoute) {
        self.route = route
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func loadView() {
        self.view = RouteCalloutView(route: route)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented...")
    }
    
}
