//
//  RoundedButton.swift
//  Random User
//
//  Created by Antoine Lefevre on 17/02/2019.
//  Copyright © 2019 Antoine Lefevre. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton : UIButton {
    
    var saveText : String?
    
    lazy var loader : UIActivityIndicatorView = {
        let acitvityIndicator = UIActivityIndicatorView(frame: CGRect(x: self.frame.width/2, y: self.frame.height/2, width: 0, height: 0))
        acitvityIndicator.hidesWhenStopped = true
        acitvityIndicator.color = .white
        return acitvityIndicator
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.addSubview(loader)
    }
    
    func animate(_ animated : Bool){
        DispatchQueue.main.async {
            self.saveText = self.titleLabel?.text
            let title = animated ? "" : self.saveText
            animated ? self.loader.startAnimating() : self.loader.stopAnimating()
            self.setTitle(title, for: .normal)
        }
    }
}
