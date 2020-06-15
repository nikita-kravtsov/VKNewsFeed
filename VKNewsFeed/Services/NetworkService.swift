//
//  NetworkService.swift
//  VKNewsFeed
//
//  Created by Никита on 6/15/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Foundation

class NetworkService {
    
    private let authService: AuthService
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
    
    
    // creating web-adress
    func getFeed() {
        
        var components = URLComponents()
        
        guard let token = authService.token else { return }
        let params = ["filters": "post, photo"]
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = API.version
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems = allParams.map { URLQueryItem(name: $0, value: $1) }
        
        let url = components.url!
        print(url)
        
    }
    
}
