//
//  ModalViewController.swift
//  Random User
//
//  Created by Antoine Lefevre on 17/02/2019.
//  Copyright © 2019 Antoine Lefevre. All rights reserved.
//

import Foundation
import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var sexeLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var user : User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstnameLabel.text = user.name.first
        lastnameLabel.text = user.name.last
        birthdateLabel.text = user.dob.date?.toString(format: "dd/MM/yy")
        sexeLabel.text = user.getStrGender()
        ageLabel.text = "\(user.dob.age ?? 0)"
        emailLabel.text = user.email
        emailLabel.adjustsFontSizeToFitWidth = true
        phoneLabel.text = user.phone
        
        guard let url = user.picture.large else { return }
        userImage.layer.cornerRadius = userImage.frame.width / 2
        userImage.clipsToBounds = true
        userImage.downloaded(from: url) { }
    }
    
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
