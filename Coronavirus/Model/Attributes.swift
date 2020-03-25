//
//  Attributes.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 22.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation

struct Attributes: Codable {
    let OBJECTID: Int
    let Country_Region: String
    let Last_Update: Int64
    let Lat: Double
    let Long_: Double
    let Confirmed: Int
    let Deaths: Int
    let Recovered: Int
}
