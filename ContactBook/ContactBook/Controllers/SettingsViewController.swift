//
//  SettingsViewController.swift
//  ContactBook
//
//  Created by Suelen Vicente on 2022-04-20.
//

import Foundation
import UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var labelLogout: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelLogout.isUserInteractionEnabled = true
        labelLogout.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(logout)))
    }
    
    @objc
    func logout() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true, completion: nil)
    }
}
