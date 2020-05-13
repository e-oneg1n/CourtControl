//
//  ViewController.swift
//  CourtControl
//
//  Created by e_oneg1n on 29.04.2020.
//  Copyright © 2020 Homecoding. All rights reserved.
//

import UIKit
import Networking

class ViewController: UIViewController {

    // MARK: - @IBActions
    
    @IBAction func signUp(_ sender: UIButton) {
        let signUpViewController = SignUpViewController(signUpService: SignUpService())
        
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.viewControllers = [signUpViewController]
        
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func login(_ sender: UIButton) {
    }
}
