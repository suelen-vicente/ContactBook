//
//  SettingsTableViewCell.swift
//  ContactBook
//
//  Created by Suelen Vicente on 2022-04-20.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBAction func touchUpInsideLogoutButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        loginViewController.modalPresentationStyle = .fullScreen
        //present(loginViewController, animated: true, completion: nil)
    }
}
