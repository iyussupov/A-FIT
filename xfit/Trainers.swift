//
//  Trainers.swift
//  xfit
//
//  Created by Dev1 on 3/10/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import Foundation

class Trainers {
    
    private var _name: String?
    
    private var _featuredImg: String?
    
    private var _category: String?
    
    private var _content: String?
    
    var name: String? {
        return _name
    }
    
    var featuredImg: String? {
        return _featuredImg
    }
    
    var category: String? {
        return _category
    }
    
    var content: String? {
        return _content
    }
    
    init (name: String?, featuredImg: String?, category: String?, content: String?) {
        self._name = name
        self._category = category
        self._featuredImg = featuredImg
        self._content = content
    }
    
    init(dictionary: AnyObject) {
        
        if let name = dictionary["name"] as? String {
            self._name = name
        }
        
        if let category = dictionary["category"] as? String {
            self._category = category
        }
        
        if let content = dictionary["content"] as? String {
            self._content = content
        }
        
        if let featuredImg = dictionary["featuredImage"] as? String {
            self._featuredImg = featuredImg
        }
        
    }
    
}