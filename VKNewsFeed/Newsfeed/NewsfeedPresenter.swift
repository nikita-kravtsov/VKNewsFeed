//
//  NewsfeedPresenter.swift
//  VKNewsFeed
//
//  Created by Никита on 6/16/20.
//  Copyright (c) 2020 Никита. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
    func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
    weak var viewController: NewsfeedDisplayLogic?
    
    func presentData(response: Newsfeed.Model.Response.ResponseType) {
        
        switch response {
            
        case .presentNewsfeed(feed: let feed):

            let cells = feed.items.map { (feedItem) in
                cellViewModel(from: feedItem)
            }
            
            let feedViewModel = FeedViewModel.init(cells: cells)
            viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayNewsfeed(feedViewModel: feedViewModel))
        }
    }
    
    private func cellViewModel(from feedItem: FeedItems) -> FeedViewModel.Cell {
        
        return FeedViewModel.Cell.init(iconUrlString: "",
                                       name: "Future name",
                                       date: "Future date",
                                       text: feedItem.text,
                                       likes: String(feedItem.likes?.count ?? 0),
                                       comments: String(feedItem.comments?.count ?? 0),
                                       shares: String(feedItem.reposts?.count ?? 0),
                                       views: String(feedItem.views?.count ?? 0))
    }
}
