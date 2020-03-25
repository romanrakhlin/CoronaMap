//
//  CustomPointAnnotation.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 22.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import UIKit
import MapKit

class CustomPointAnnotation: MKPointAnnotation {
    var feature: Feature?
    
    override init() {
        super.init()
    }
}
