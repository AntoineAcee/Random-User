//
//  ViewController.swift
//  Random User
//
//  Created by Antoine Lefevre on 16/02/2019.
//  Copyright © 2019 Antoine Lefevre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueModalViewController", let modalViewController = segue.destination as? ModalViewController, let user = UserDefaultsManager.shared.getSaveUser(){
            modalViewController.user = user
        }
    }
    
    func callApi(){
        self.goButton.animate(true)
        ApiManager.shared.getRandomUser { (user) in
            user?.save()
            DispatchQueue.main.async { self.performSegue(withIdentifier: "segueModalViewController", sender: nil) }
            self.goButton.animate(false)
        }
    }
    
    @IBAction func onGo(_ sender: Any) {
        if UserDefaultsManager.shared.getSaveUser() != nil{
            self.performSegue(withIdentifier: "segueModalViewController", sender: nil)
            return
        }
        self.callApi()
    }
    
    @IBAction func onClear(_ sender: Any) {
        UserDefaultsManager.shared.clearData()
    }
}
