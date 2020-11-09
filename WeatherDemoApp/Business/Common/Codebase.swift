//
//  Codebase.swift
//  WeatherDemoApp
//
//  Created by Naeem Paracha on 09/11/2020.
//  Copyright © 2020 Naeem Paracha. All rights reserved.
//

import Foundation

class Codebase {
    
    #if PRODUCTION
    //https://pro.openweathermap.org/data/2.5/forecast/climate?q={city name},{country code}&appid={API key}
    static var version = 2.5
    static var baseUrl = "https://api.openweathermap.org/data/\(version)/"
    static var apiKey = "60bcf543cc47700cddcb390f9143b9d6"
    static var iconUrl = "https://openweathermap.org/img/wn/"
    
    #elseif STAGING
    static var version = 2.5
    static var baseUrl = "https://api.openweathermap.org/data/\(version)/"
    static var apiKey = "60bcf543cc47700cddcb390f9143b9d6"
    static var iconUrl = "https://openweathermap.org/img/wn/"
    
    #else
    static var version = 2.5
    static var baseUrl = "https://api.openweathermap.org/data/\(version)/"
    static var apiKey = "60bcf543cc47700cddcb390f9143b9d6"
    static var iconUrl = "https://openweathermap.org/img/wn/"
    
    #endif

}
