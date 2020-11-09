//
//  Utils.swift
//  WeatherDemoApp
//
//  Created by Naeem Paracha on 09/11/2020.
//  Copyright © 2020 Naeem Paracha. All rights reserved.
//

import UIKit

class Utils {
    
    static func formatToHourlyTime(_ timeStamp: Double) -> String {
           let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "ha"
           return dateFormatter.string(from: date)
       }
    
    static func formate(_ timeStamp: Double) -> String {
        let date =  Date(timeIntervalSince1970: TimeInterval(timeStamp))
        let formater = DateFormatter()
        formater.dateFormat = "EEEE"
        return formater.string(from: date)
    }
    
    
    static func unitChanged() -> String{
        var tempUnit = "C"
        if let isCentigrade = UserDefaultsManager.instance.getValue(forKey: .isCentigrade) as? Bool, isCentigrade {
            let _ = UserDefaultsManager.instance.store(value: false, forKey:.isCentigrade)
            tempUnit = "C"
        } else {
            let _ = UserDefaultsManager.instance.store(value: true, forKey:.isCentigrade)
            tempUnit = "F"
        }
        return tempUnit
    }
    
    static func getUnit() -> String {
        var tempUnit = "C"
        if let isCentigrade = UserDefaultsManager.instance.getValue(forKey: .isCentigrade) as? Bool, isCentigrade {
            tempUnit = "F"
        } else {
            tempUnit = "C"
        }
        return tempUnit
    }
}
