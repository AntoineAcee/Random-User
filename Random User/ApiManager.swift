//
//  ApiManager.swift
//  Random User
//
//  Created by Antoine Lefevre on 17/02/2019.
//  Copyright © 2019 Antoine Lefevre. All rights reserved.
//

import Foundation

class ApiManager: NSObject {
    static let shared = ApiManager()
    
    let baseURL = "https://api.randomuser.me/"
    
    func getRandomUser(completion: @escaping (User?) -> Void){
        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, err in
            
            guard let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] ?? [:],
                let results = json["results"] as? [[String:Any]], let result = results.first
                else {
                    completion(nil)
                    return
            }
            
            completion(User(json: result))
            
            }.resume()
    }
}
