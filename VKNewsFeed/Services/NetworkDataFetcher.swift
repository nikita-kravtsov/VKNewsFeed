//
//  NetworkDataFetcher.swift
//  VKNewsFeed
//
//  Created by Никита on 6/16/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Foundation
// created interface that will convert the received JSON data to the format we need
protocol DataFetcher {
    func getFeed(response: @escaping (FeedResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    init(networking: Networking) {
        self.networking = networking
    }
    
    func getFeed(response: @escaping (FeedResponse?) -> Void) {
        
        let params = ["filters": "post, photo"]
        networking.request(path: API.newsFeed, params: params) { (data, error) in
            
            let decoded = self.decodeJSON(type: FeedResponseWrapped.self, data: data)
            response(decoded?.response)
            
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = data, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}

