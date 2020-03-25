//
//  Feature.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 22.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

struct Feature: Codable {
    let attributes: Attributes
    
    var administrativeArea: String?
    var subAdministrativeArea: String?
    
    enum CodingKeys: String, CodingKey {
      case attributes
    }
    
    public func coordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: attributes.Lat, longitude: attributes.Long_)
    }
    
    public func annotation() -> CustomPointAnnotation {
        let annotation = CustomPointAnnotation()
        annotation.coordinate = coordinate()
        annotation.title = attributes.Country_Region
        annotation.feature = self
        return annotation
    }
    
    public func date() -> Date {
        print(TimeInterval(attributes.Last_Update / 1000))
        return Date.init(timeIntervalSince1970: TimeInterval(attributes.Last_Update / 1000))
    }
}
