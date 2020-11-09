//
//  ForecastViewModel.swift
//  WeatherDemoApp
//
//  Created by Naeem Paracha on 09/11/2020.
//  Copyright © 2020 Naeem Paracha. All rights reserved.
//

import UIKit
import CoreLocation
import Moya

protocol ForecastViewModelProtocol: class {
    func displayWeatherData(forecast: Forecast)
}

class ForecastViewModel {
    
    let locationServices = LocationManager.sharedInstance
    let forecastApiProvider = MoyaProvider<WeatherService>()
    
    weak var delegate: ForecastViewModelProtocol?
    
    
    
    func locationPermession() {
        LocationManager.sharedInstance.newestLocation = { coordinate in
            guard let coordinate = coordinate else {
                return
            }
            self.getforecast(for: coordinate)
        }
        
        locationServices.statusUpdated = { status in
            if status == .authorizedWhenInUse {
                self.locationServices.getLocation()
            }
        }
        
        switch locationServices.status {
        case .notDetermined:
            locationServices.getPermission()
        case .authorizedWhenInUse:
            locationServices.getLocation()
        default:
            print("Default")
        }
    }
    
    func getforecast(for coordinate: CLLocationCoordinate2D) {
        var tempUnit = "metric"
        if let isCentigrade = UserDefaultsManager.instance.getValue(forKey: .isCentigrade) as? Bool, isCentigrade {
            tempUnit = "metric"
        } else {
            tempUnit = "imperial"
        }
        forecastApiProvider.request(.forecast(coordinate.latitude, coordinate.longitude, tempUnit)) { (result) in
            switch result {
            case .success(let response):
                do {
                    guard let responseJSON = try response.mapJSON() as? Dictionary<String, Any?> else {
                        return
                    }
                    let responseData = try JSONSerialization.data(withJSONObject: responseJSON)
                    
                    guard let  weatherResponse = try? JSONDecoder().decode(Forecast.self, from: responseData) else{
                         print("Error:: bad request")
                        return
                    }
                    self.delegate?.displayWeatherData(forecast: weatherResponse)
                } catch(let error) {
                    print("Error::", error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}

