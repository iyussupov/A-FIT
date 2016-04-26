//
//  Selfy.swift
//  xfit
//
//  Created by Dev1 on 3/11/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import Foundation

class Selfy {
    
    private var _name: String?
    
    private var _featuredImg: String?
    
    private var _thumbnailImg: String?
    
    private var _tags: String?
    
    private var _likes_count: Int?
    
    private var _likes: Bool?
    
    private var _comments_count: Int?
    
    private var _comments_feed: String?
    
    var name: String? {
        return _name
    }
    
    var featuredImg: String? {
        return _featuredImg
    }
    
    var tags: String? {
        return _tags
    }
    
    var comments_feed: String? {
        return _comments_feed
    }
    
    var likes_count: Int? {
        return _likes_count
    }
    
    var likes: Bool? {
        return _likes
    }
    
    var comments_count: Int? {
        return _comments_count
    }
    
    init (name: String?, featuredImg: String?, tags: String?, comments_feed: String?, likes_count: Int?, likes: Bool?, comments_count: Int?) {
        self._name = name
        self._featuredImg = featuredImg
        self._tags = tags
        self._comments_feed = comments_feed
        self._likes_count = likes_count
        self._likes = likes
        self._comments_count = comments_count
    }
    
    init(dictionary: AnyObject) {
        
        if let name = dictionary["name"] as? String {
            self._name = name
        }
        
        if let featuredImg = dictionary["featuredImg"] as? String {
            self._featuredImg = featuredImg
        }
        
        if let tags = dictionary["tags"] as? String {
            self._tags = tags
        }
        
        if let comments_feed = dictionary["comments_feed"] as? String {
            self._comments_feed = comments_feed
        }
        
        if let likes_count = dictionary["likes_count"] as? Int {
            self._likes_count = likes_count
        }
        
        if let likes = dictionary["likes"] as? Bool {
            self._likes = likes
        }
        
        if let comments_count = dictionary["comments_count"] as? Int {
            self._comments_count = comments_count
        }
        
        
    }
    
}