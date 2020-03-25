//
//  PanelLayout.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 22.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import UIKit
import FloatingPanel

class PanelLayout: FloatingPanelLayout {
    
    var initialPosition: FloatingPanelPosition {
        return .tip
    }
    var supportedPositions: Set<FloatingPanelPosition> {
        return [.tip]
    }

    func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        switch position {
            case .tip: return 200
            default: return nil
        }
    }
}
