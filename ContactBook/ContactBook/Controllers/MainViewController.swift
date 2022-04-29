//
//  ViewController.swift
//  ContactBook
//
//  Created by Suelen Vicente on 2022-04-20.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func touchUpInsideLoginButton(_ sender: Any) {
        guard let password = passwordTextField.text else{
                  return
              }
        
        if password == "123456"{
            let homeVC = HomeViewController()
            homeVC.modalPresentationStyle = .fullScreen
            present(homeVC, animated: true, completion: nil)
        }else{
            let alertController = UIAlertController(title: title, message: "Username or Password was incorrect.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func touchUpInsideRegisterButton(_ sender: Any) {
        let alertController = UIAlertController(title: title, message: "Register functionality is currently disabled.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

