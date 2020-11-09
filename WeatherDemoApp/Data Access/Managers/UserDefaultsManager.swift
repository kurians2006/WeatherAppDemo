//
//  UserDefaultsManager.swift
//  WeatherDemoApp
//
//  Created by Naeem Paracha on 09/11/2020.
//  Copyright © 2020 Naeem Paracha. All rights reserved.
//

import UIKit

class UserDefaultsManager {
    
    static let instance = UserDefaultsManager()
    
    fileprivate let userDefault: UserDefaults
    
    enum Key: String {
        case isCentigrade = "isCentigrade"

        var value: String {
            return rawValue
        }
    }
    
    private init() {
        userDefault = UserDefaults.standard
    }
    
    func store(value: Any, forKey: Key) -> Bool {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: false)
            userDefault.set(data, forKey: forKey.value)
            userDefault.synchronize()
            return true
        }
        catch {
            return false
        }
    }
    
    func getValue(forKey: Key) -> Any? {
        guard let data = userDefault.object(forKey: forKey.value) else {
            return nil
        }
        do {
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data as! Data)
        }
        catch {
            return nil
        }
    }
    
    func removeValue(forKey: Key)
    {
        userDefault.removeObject(forKey: forKey.rawValue)
        userDefault.synchronize()
    }

}

