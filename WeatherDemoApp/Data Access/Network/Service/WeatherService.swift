//
//  WeatherService.swift
//  WeatherDemoApp
//
//  Created by Naeem Paracha on 09/11/2020.
//  Copyright © 2020 Naeem Paracha. All rights reserved.
//

import Moya

enum WeatherService {
    case forecast(Double, Double, String)
}

extension WeatherService: TargetType {
    var baseURL: URL {
        return URL(string: Codebase.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .forecast:
            return "onecall"
        }
    }
    
    var method: Method {
        switch self {
        case .forecast:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .forecast (let lat, let long, let unit):
            return .requestParameters(parameters: ["lat": lat, "lon": long, "units": unit, "appid": Codebase.apiKey] , encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }

}
