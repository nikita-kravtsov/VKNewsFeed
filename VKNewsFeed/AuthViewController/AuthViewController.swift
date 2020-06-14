//
//  ViewController.swift
//  VKNewsFeed
//
//  Created by Никита on 6/14/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        
        view.backgroundColor = .red
    }
    
    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

