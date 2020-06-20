//
//  ViewController.swift
//  VKNewsFeed
//
//  Created by Никита on 6/14/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var signInLabel: UIButton!
    
    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        signInLabel.layer.cornerRadius = 10
    }
    
    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

