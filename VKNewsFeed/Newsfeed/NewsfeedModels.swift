//
//  NewsfeedModels.swift
//  VKNewsFeed
//
//  Created by Никита on 6/16/20.
//  Copyright (c) 2020 Никита. All rights reserved.
//

import UIKit

enum Newsfeed {
   
  enum Model {
    
    struct Request {
      enum RequestType {
        case some
        case getFeed
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentNewsfeed
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayNewsfeed
      }
    }
  }
  
}
