//
//  Chart.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 23.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation

struct Chart {
    let categories: String
    let data: String
    let graphs: [TotalCases] = []
}

struct TotalCases {
    let totalCases: [Details] = []
}

struct Details {
    let title: String
    let details: String
}
