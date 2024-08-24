//
//  RouteCalloutView.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 20/08/2024.
//

import Foundation
import MapKit

class RouteCalloutView: NSView {

    private var route: MKRoute
    
    init(route: MKRoute, frame: NSRect = NSRect(x: 0, y: 0, width: 450, height: 250)) {
        self.route = route
        super.init(frame: frame)
        configure()
    }
    
    private func directionsIcon(_ instruction: String) -> String {
        if instruction.contains("destination") {
            return "mappin.and.ellipse"
        } else if instruction.contains("on your right") {
            return "arrow.right"
        } else if instruction.contains("on your left") {
            return "arrow.left"
        } else if instruction.contains("right") {
            return "arrow.turn.up.right"
        } else if instruction.contains("left") {
            return "arrow.turn.up.left"
        } else if instruction.contains("roundabout") {
            return "arrow.triangle.2.circlepath"
        } else {
            return "arrow.up"
        }
    }
    
    private func configure() {
        
        let documentView = NSView(frame: .zero)
        
        let distanceFormatter = DistanceFormatter()
        
        var offsetY: CGFloat = 0
        
        for step in route.steps.reversed() {
            
            if step.instructions.isEmpty {
                continue
            }
            
            let hStackView = NSStackView(frame: CGRect(x: 0.0, y: offsetY, width: frame.width, height: 60))
            hStackView.edgeInsets = .init(top: 20, left: 20, bottom: 0, right: 20)
            hStackView.alignment = .left
            hStackView.orientation = .horizontal
            
            let directionImage = NSImage(systemSymbolName: directionsIcon(step.instructions), accessibilityDescription: nil)
            let imgView = NSImageView(image: directionImage!)
            
            let instructionTextField = NSTextField(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
            instructionTextField.stringValue = step.instructions
            instructionTextField.isEditable = false
            instructionTextField.isBezeled = false
            
            let distanceTextField = NSTextField(frame: NSRect(x: 0, y: 0, width: 100, height: 60))
            guard let value = UserDefaults.standard.value(forKey: "distanceUnit") as? String ,
                  let distanceUnit = DistanceUnit(rawValue: value) else { return }
            
            distanceFormatter.unitOptions = distanceUnit
            
            distanceTextField.stringValue = "\(distanceFormatter.format(distanceInMeters: step.distance))"
            distanceTextField.isEditable = false
            distanceTextField.isBezeled = false
            distanceTextField.wantsLayer = true
            distanceTextField.layer?.opacity = 0.4
            
            let vStackView = NSStackView()
            vStackView.alignment = .left
            vStackView.orientation = .vertical
            
            vStackView.addArrangedSubview(instructionTextField)
            vStackView.addArrangedSubview(distanceTextField)
            
            hStackView.addArrangedSubview(imgView)
            hStackView.addArrangedSubview(vStackView)
            
            documentView.addSubview(hStackView)
            
            offsetY += 60
        }
        
        documentView.frame = .init(x: 0, y: 0, width: 400, height: offsetY)
        
        let scrollView = NSScrollView(frame: frame)
        scrollView.hasVerticalScroller = true
        scrollView.documentView = documentView
        scrollView.automaticallyAdjustsContentInsets = false
        scrollView.contentInsets = NSEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        scrollView.documentView?.scroll(NSPoint(x: 0, y: documentView.frame.height))
        scrollView.verticalScroller?.floatValue = 0
        
        self.addSubview(scrollView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented...")
    }
    
}
