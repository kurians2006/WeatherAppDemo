//
//  HourlyViewModel.swift
//  WeatherDemoApp
//
//  Created by Naeem Paracha on 09/11/2020.
//  Copyright © 2020 Naeem Paracha. All rights reserved.
//

import Foundation


class HourlyViewModel {

private let hourlyModel:Current

    init(model:Current) {
        self.hourlyModel = model
    }
    
    var temperature: String {
        let tempUnit = Utils.getUnit()
        let temperature = hourlyModel.temp ?? 0
        return String("Temperatue - \(temperature) \(tempUnit)")
    }
    
    var feelLike: String {
        let tempUnit = Utils.getUnit()
        let feelLike = hourlyModel.feelsLike ?? 0
        return String("Feellike - \(feelLike) \(tempUnit)")
    }
    
    var day: String {
        let dayTime  = Utils.formate(Double(hourlyModel.dt ?? 00))
        return dayTime
    }
    
    var time: String {
        let time = Utils.formatToHourlyTime(Double(hourlyModel.dt ?? 00))
        return time
    }
    
    var iconUrl :URL? {
        let iconURL = String(hourlyModel.weather?[0].icon ?? "10d")
        return URL(string: "\(Codebase.iconUrl)/\(iconURL).png")
    }
    
    var iconUrl2x :URL? {
           let iconURL = String(hourlyModel.weather?[0].icon ?? "10d")
           return URL(string: "\(Codebase.iconUrl)/\(iconURL)@2x.png")
    }
}
