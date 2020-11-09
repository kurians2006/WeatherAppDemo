//
//  LocalNotificationManager.swift
//  WeatherDemoApp
//
//  Created by Naeem Paracha on 09/11/2020.
//  Copyright © 2020 Naeem Paracha. All rights reserved.
//

import Foundation
import UserNotifications

struct Notification {
    var id: String
    var title: String
}

class LocalNotificationManager : NSObject{
    static let sharedInstance: LocalNotificationManager = LocalNotificationManager()
    let center = UNUserNotificationCenter.current()
        
    private override init() {
        super.init()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
    }
    
    
    
    
    func scheduleNotifications(title:String, body:String) -> Void {
        // Step 2: Create the notification content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        // Step 3: Create the notification trigger
        let date = Date().addingTimeInterval(10)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Step 4: Create the request
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Step 5: Register the request
        center.add(request) { (error) in
            // Check the error parameter and handle any errors
        }
    }
}
