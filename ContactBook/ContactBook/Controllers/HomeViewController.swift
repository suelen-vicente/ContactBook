//
//  HomeViewController.swift
//  ContactBook
//
//  Created by Suelen Vicente on 2022-04-20.
//

import UIKit

class HomeViewController: UITabBarController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let contactsVC = UINavigationController(rootViewController: ContactsViewController())
        contactsVC.tabBarItem = UITabBarItem(title: "Contacts", image: .add, tag: 0)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsViewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController")
        
        navigationController?.pushViewController(settingsViewController, animated: true)
        let moreVC = UINavigationController(rootViewController: settingsViewController)
        moreVC.tabBarItem = UITabBarItem(title: "More", image: .remove, tag: 1)
        
        viewControllers = [contactsVC, moreVC]
    }
}
