//
//  MapViewCoordinator.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 17/08/2024.
//

import Foundation
import MapKit

final class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
    private var hasSetInitialRegion = false
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        
        if !hasSetInitialRegion {
            let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.07, longitudeDelta: 0.07))
            
            mapView.setRegion(region, animated: true)
            hasSetInitialRegion = true
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        guard let annotation = view.annotation as? PlaceAnnotation else {
            return
        }
        
        view.canShowCallout = true
        view.detailCalloutAccessoryView = PlaceCalloutView(annotation: annotation, selectShowDirections: { [weak self] place in
            
            let start = MKMapItem.forCurrentLocation()
            let destination = MKMapItem(placemark: MKPlacemark(coordinate: place.coordinate))
            
            self?.calculateRoute(start: start, destination: destination) { route in
                if let route = route {
                    
                    view.detailCalloutAccessoryView = nil
                    
                    let controller = RouteContentViewController(route: route)
                    let routePopover = RoutePopoverView(controller: controller)
                    
                    let positioningView = NSView(frame: NSRect(x: 0, y: 0, width: mapView.frame.width/2, height: 30.0))
                    
                    mapView.addSubview(positioningView)
                    
                    // clear all overlays
                    mapView.removeOverlays(mapView.overlays)
                    
                    // add overlay on the map
                    mapView.addOverlay(route.polyline, level: .aboveRoads)
                    
                    routePopover.show(relativeTo: positioningView.frame, of: positioningView, preferredEdge: .minY)
                }
            }
        })
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.lineWidth = 5.0
        renderer.strokeColor = NSColor.orange
        return renderer
        
    }
    
    func calculateRoute(start: MKMapItem, destination: MKMapItem, completion: @escaping (MKRoute?) -> Void) {
        
        let directionRequest = MKDirections.Request()
        directionRequest.transportType = .automobile
        directionRequest.source = start
        directionRequest.destination = destination
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { response, error in
            if let error = error {
                print("Unable to calculate directions: \(error)")
                return
            }
            
            guard let response = response, let route = response.routes.first else {
                return
            }
            
            completion(route)
        }
        
    }
    
    func recenterMap() {
        hasSetInitialRegion = false
    }
    
}
