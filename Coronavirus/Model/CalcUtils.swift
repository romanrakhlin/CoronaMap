//
//  CalcUtils.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 22.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation

class CalcUtils {
    static func absoluteDistance(confirm: Int) -> Double {
        let unit: Double = 150000
        return log10(Double(confirm) + 1) * unit
    }

    static func relativeDistance(delta: Double, confirm: Int) -> Double {
        let unitM: Double = 2 * Double.pi * 6378150 / 10000
        let unit: Double = unitM * delta
        return log2(Double(confirm) + 1) * unit / 3
    }
}
