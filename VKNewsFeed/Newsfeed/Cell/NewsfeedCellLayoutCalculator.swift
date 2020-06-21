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
    static let bottonViewHeight: CGFloat = 45
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
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left, y: Constants.postLabelInsets.top),
                                    size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        //MARK:- Work with postImageFrame
        
        let postImageTop = postLabelFrame.size == CGSize.zero ? Constants.postLabelInsets.top : postLabelFrame.maxY + Constants.postLabelInsets.bottom
        
        var postImageFrame = CGRect(origin: CGPoint(x: 0, y: postImageTop),
                                    size: CGSize.zero)
        
        if let postImage = postPhotoAttacnment {
            let photoHeight: Float = Float(postImage.height)
            let photoWidth: Float = Float(postImage.width)
            let ratio = CGFloat(photoHeight / photoWidth)
            postImageFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * ratio)
        }
        
        //MARK: - Work with bottomViewFrame
        
        let bottomViewTop = max(postLabelFrame.maxY, postImageFrame.maxY)
        
        let bottomViewFrame = CGRect(origin: CGPoint(x: 0, y: bottomViewTop),
                                     size: CGSize(width: cardViewWidth, height: Constants.bottonViewHeight))
        
        //MARK: - Work with totalHeight
        
        let totalheight = bottomViewFrame.maxY + Constants.cardInsets.bottom
        
        
        return Sizes(postLabelFrame: postLabelFrame,
                     postImageFrame: postImageFrame,
                     bottomViewFrame: bottomViewFrame,
                     totalHeight: totalheight)
    }
}
