//
//  Extensions.swift
//  Random User
//
//  Created by Antoine Lefevre on 17/02/2019.
//  Copyright © 2019 Antoine Lefevre. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit, callback : @escaping () -> ()) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    callback()
                    return
            }
            DispatchQueue.main.async() {
                self.image = image
                callback()
            }
            }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit, callback : @escaping () -> ()) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: contentMode) {
            callback()
        }
    }
}

extension String {
    
    func toDate(format: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        if let date = dateFormatter.date(from: self) {
            return date
        }
        
        return Date()
    }
}

extension Date {
    
    func toString(format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
        
    }
    
    func getYearDifferenceFrom(date: Date) -> Int {
        
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: self, to: date)
        
        return ageComponents.year!
        
    }
}
