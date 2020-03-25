
//
//  ChartViewController.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 23.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import UIKit
import Charts
import Alamofire

class ChartViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var chartView: BarChartView!
    
    var categories: [String] = []
    var datadata: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chartView.noDataText = "Загрузка..."
        
        AF.request("https://covid19-update-api.herokuapp.com/api/v1/cases/graphs").responseData { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try decoder.decode(Chart.self, from: data)
                    self.categories = result.graphs.totalCases.categories
                    self.datadata = result.graphs.totalCases.data
                    self.setChart(values: self.datadata.map{ Double($0) })
                } catch { print(error) }
            }
        }
        
        chartView.delegate = self as! ChartViewDelegate
        chartView.xAxis.valueFormatter = self
    }
    
    func setChart(values: [Double]) {

        let chartData = BarChartDataSet()
        for (i, val) in values.enumerated(){
            _ = chartData.addEntry(BarChartDataEntry(x: Double(i), y: val))
        }
        chartView.data = BarChartData(dataSet: chartData)
        
        chartData.colors = [UIColor.red]
        chartData.barBorderColor = UIColor.lightGray
        chartData.barBorderWidth = 1
        chartData.barShadowColor = UIColor.black
        chartView.legend.enabled = false
    }
}

extension ChartViewController: IAxisValueFormatter{
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return categories[Int(value) % categories.count]
    }
}
