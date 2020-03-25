//
//  FeatureServer.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 22.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation

struct FeatureServer: Codable {
    let objectIdFieldName: String
    let globalIdFieldName: String
    let geometryType: String
    let features: [Feature]
}
