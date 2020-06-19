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
        case getNewsfeed
      }
    }
    struct Response {
      enum ResponseType {
        case presentNewsfeed(feed: FeedResponse)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayNewsfeed(feedViewModel: FeedViewModel)
      }
    }
  }
}

struct FeedViewModel {
    
    struct Cell: FeedCellViewModel  {
        var iconUrlString: String
        var name: String
        var date: String
        var text: String?
        var photoAttachment: FeedCellPhotoAttachementViewModel?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
    }
    
    struct FeedCellPhotoAttachment: FeedCellPhotoAttachementViewModel {
        var photoUrlString: String?
        var width: Int
        var height: Int
    }
    
    let cells: [Cell]
}
