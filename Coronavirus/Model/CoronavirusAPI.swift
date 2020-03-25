//
//  CoronavirusAPI.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 22.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import Foundation
import Alamofire

class CoronavirusAPI: NSObject {
    
    let requestUrl = "https://services1.arcgis.com/0MSEUqKaxRlEPj5g/arcgis/rest/services/ncov_cases/FeatureServer/1/query?f=json&where=1%3D1&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&resultRecordCount=250&cacheHint=true"

    internal func request(callback:@escaping ([Feature], NSError?)->Void)
    {
        AF.request(requestUrl)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let data = response.data else { return }
                    let model: FeatureServer = try! JSONDecoder().decode(FeatureServer.self, from: data)
                    callback(model.features, nil)
                case .failure(let error):
                    print("Error")
                }
        }
    }
}
