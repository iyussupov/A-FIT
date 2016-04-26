//
//  News.swift
//  xfit
//
//  Created by Ingwar on 3/5/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import Foundation

class News {
    
    private var _title: String?
    
    private var _featuredImg: String?
    
    private var _content: String?
    
    private var _category: String?
    
    private var _date: NSDate?
    
    private var _commentCount: Int!
    
    private var _postKey: String!
    
    var title: String? {
        return _title
    }
    
    var content: String? {
        return _content
    }
    
    var featuredImg: String? {
        return _featuredImg
    }
    
    var category: String? {
        return _category
    }
    
    var date: NSDate? {
        return _date
    }
    
    var commentCount: Int? {
        return _commentCount
    }
    
    var postKey: String? {
        return _postKey
    }
    
    init (title: String?, content: String?, featuredImg: String?, category: String?, date: NSDate?, commentCount:Int?) {
        self._title = title
        self._content = content
        self._category = category
        self._featuredImg = featuredImg
        self._date = date
        self._commentCount = commentCount
    }
    
    init(dictionary: AnyObject) {
        
        if let title = dictionary["title"] as? String {
            self._title = title
        }
        
        if let content = dictionary["content"] as? String {
            self._content = content
        }
        
        if let category = dictionary["category"] as? String {
            self._category = category
        }
        
        if let featuredImg = dictionary["featuredImage"] as? String {
            self._featuredImg = featuredImg
        }
        
        if let commentCount = dictionary["comments"] as? Int {
            self._commentCount = commentCount
        }
        
    }
    
}