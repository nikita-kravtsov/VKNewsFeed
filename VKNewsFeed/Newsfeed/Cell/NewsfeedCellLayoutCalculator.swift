//
//  NewsfeedCellLayoutCalculator.swift
//  VKNewsFeed
//
//  Created by Никита on 6/20/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import Foundation
import UIKit

protocol FeedCellLayoutCalculatorProtocol {
    func sizes(postText: String?, postPhotoAttacnment: FeedCellPhotoAttachementViewModel?) -> FeedCellSizes
}

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var postImageFrame: CGRect
    var bottomViewFrame: CGRect
    var totalHeight: CGFloat
    
}

struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 10, right: 8)
    static let topViewHeight: CGFloat = 37
    static let postLabelInsets = UIEdgeInsets(top: 3 + Constants.topViewHeight + 8,
                                              left: 8,
                                              bottom: 8,
                                              right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
}

final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {
    
    private let screenWidth: CGFloat
    // initializer accepts phone size width
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    func sizes(postText: String?, postPhotoAttacnment: FeedCellPhotoAttachementViewModel?) -> FeedCellSizes {
        // fix the width CardView
        let cardViewWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
        
        //MARK:- Work with postLabelFrame
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left,
                                                    y: Constants.postLabelInsets.top),
                                    size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        return Sizes(postLabelFrame: postLabelFrame,
                     postImageFrame: CGRect.zero,
                     bottomViewFrame: CGRect.null,
                     totalHeight: 300)
    }
}
