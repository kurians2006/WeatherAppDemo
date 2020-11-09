//
//  DailyWeatherViewModel.swift
//  WeatherDemoApp
//
//  Created by Naeem Paracha on 09/11/2020.
//  Copyright © 2020 Naeem Paracha. All rights reserved.
//

import Foundation

class DailyWeatherViewModel {

private let dailyModel: Daily

    init(model:Daily) {
        self.dailyModel = model
    }
    
    var maxTemp: String {
        let maxTemp = dailyModel.temp?.max ?? 0
        return String(maxTemp)
    }
    
    var minTemp: String {
        let minTemp = dailyModel.temp?.min ?? 0
        return String(minTemp)
    }
    
    var temperature : String {
        let tempUnit = Utils.getUnit()
        
        return "\(minTemp) - \(maxTemp) \(tempUnit)"
    }
    
    var day: String {
        let dayTime  = Utils.formate(Double(dailyModel.dt ?? 00))
        return dayTime
    }
    
    var time: String {
        let time = Utils.formatToHourlyTime(Double(dailyModel.dt ?? 00))
        return time
    }
    
    var iconUrl :URL? {
        let iconURL = String(dailyModel.weather?[0].icon ?? "10d")
        return URL(string: "\(Codebase.iconUrl)/\(iconURL).png")
    }
    
    var iconUrl2x :URL? {
           let iconURL = String(dailyModel.weather?[0].icon ?? "10d")
           return URL(string: "\(Codebase.iconUrl)/\(iconURL)@2x.png")
    }
}
