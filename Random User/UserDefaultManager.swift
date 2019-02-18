//
//  UserDefaultManager.swift
//  Random User
//
//  Created by Antoine Lefevre on 17/02/2019.
//  Copyright © 2019 Antoine Lefevre. All rights reserved.
//

import Foundation

class UserDefaultsManager : NSObject {
    static let shared = UserDefaultsManager()
    
    func clearData(){
        UserDefaults.standard.removeObject(forKey: "user")
    }
    
    func getSaveUser() -> User?{
        guard let decoded  = UserDefaults.standard.object(forKey: "user") as? Data,
            let decodedUser = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? User else { return nil }
        return decodedUser
    }
}
