//
//  TotalView.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 22.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import UIKit

class TotalView: UIView {
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    
    func setFeature(features: [Feature]) {
        
        let totalConfirmed = features.map{$0.attributes.Confirmed}.reduce(0, +)
        let totalDeaths = features.map{$0.attributes.Deaths}.reduce(0, +)
        let totalRecovered = features.map{$0.attributes.Recovered}.reduce(0, +)
        confirmedLabel.text = String(totalConfirmed)
        deathsLabel.text = String(totalDeaths)
        recoveredLabel.text = String(totalRecovered)
    }
}
