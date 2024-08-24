//
//  RoutePopoverView.swift
//  Maps
//
//  Created by Róbert Šumšala Jr. on 20/08/2024.
//

import Foundation
import AppKit

class RoutePopoverView: NSPopover {
    
    init(controller: RouteContentViewController) {
        super.init()
        self.contentViewController = controller
        self.contentSize = controller.view.frame.size
        self.behavior = .transient
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
