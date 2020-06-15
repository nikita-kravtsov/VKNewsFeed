//
//  NetworkService.swift
//  VKNewsFeed
//
//  Created by Никита on 6/15/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Foundation

protocol Networking {
    func request(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {
    
    private let authService: AuthService
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
    
    func request(path: String, params: [String : String], completion: @escaping (Data?, Error?) -> Void) {
        
        guard let token = authService.token else { return }
        
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = API.version
        
        let url = self.url(path: path, params: allParams)
        let session = URLSession.init(configuration: .default)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
        print(url)
    }
    
    private func url(path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        
        return components.url!
    }
}
