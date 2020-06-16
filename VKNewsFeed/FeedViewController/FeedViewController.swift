//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Никита on 6/14/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
        
    var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map{ (feedItem) in
                print(feedItem.date)
            }
        }
        
    }
}

