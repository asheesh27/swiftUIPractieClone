//
//  UserManager.swift
//  GeotheLearningClone
//
//  Created by Palnar on 11/01/23.
//

import Foundation

class UserManager{
    
    private let userDefaults = UserDefaults.standard
    
    var userProfileData: UserDetails? {
        get{
            let decoder = JSONDecoder()
            if let data = userDefaults.object(forKey: "saved_data") as? Data {
                guard let savedData = try? decoder.decode(UserDetails.self, from: data) else { return nil }
                return savedData
            }
            else {
                return nil
            }
        }
        set (newValue) {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: "saved_data")
            }
        }
    }
    
    var isUserLogin: Bool {
        get {
            return userDefaults.object(forKey: "isUserLogin") as? Bool ?? false
        }
        set (newValue) {
            userDefaults.set(newValue, forKey: "isUserLogin")
            userDefaults.synchronize()
        }
    }
    
}
