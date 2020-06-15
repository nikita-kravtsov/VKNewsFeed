//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Никита on 6/14/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        networkService.getFeed()
    }
}
