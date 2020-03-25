//
//  Chart.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 23.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation

struct Chart: Decodable {
    let total: Int
    let graphs: TotalCases
}

struct TotalCases: Decodable {
    let totalCases: Details
}

struct Details: Decodable {
    let categories: [String]
    let data: [Double]
}
