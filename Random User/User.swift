//
//  User.swift
//  Random User
//
//  Created by Antoine Lefevre on 17/02/2019.
//  Copyright © 2019 Antoine Lefevre. All rights reserved.
//

import Foundation

enum Gender: String {
    case Male = "male"
    case Female = "female"
}

class User: NSObject, NSCoding{
    let json : [String:Any]
    let gender: Gender?
    let name: Name
    let email: String?
    let dob: Dob
    let phone: String?
    let picture: Picture
    
    init(json: [String:Any]){
        self.json = json
        self.gender = Gender(rawValue: json["gender"] as? String ?? "")
        self.name = Name(json: json["name"] as? [String:Any] ?? [:])
        self.email = json["email"] as? String
        self.dob = Dob(json: json["dob"] as? [String:Any] ?? [:])
        self.phone = json["phone"] as? String
        self.picture = Picture(json: json["picture"] as? [String:Any] ?? [:])
    }
    
    func save(){
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: self)
        UserDefaults.standard.setValue(encodedData, forKey: "user")
        UserDefaults.standard.synchronize()
    }
    
    func getStrGender() -> String {
        guard let gender = self.gender else { return "NC"}
        switch gender{
        case .Male:
            return "Mr"
        case .Female:
            return "Mme"
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(json, forKey: "json")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let json = aDecoder.decodeObject(forKey: "json") as! [String:Any]
        self.init(json: json)
    }
}

class Dob: NSObject {
    let date: Date?
    let age: Int?
    
    init(json: [String:Any]){
        self.date = (json["date"] as? String ?? "").toDate(format: "yyyy-MM-dd'T'HH:mm:ss'Z'")
        self.age = json["age"] as? Int
    }
}

class Name: NSObject {
    let first, last: String?
    
    init(json: [String:Any]){
        self.first = json["first"] as? String
        self.last = json["last"] as? String
    }
}

class Picture: NSObject {
    let large, medium, thumbnail: String?
    
    init(json: [String:Any]){
        self.large = json["large"] as? String
        self.medium = json["medium"] as? String
        self.thumbnail = json["thumbnail"] as? String
    }
}
