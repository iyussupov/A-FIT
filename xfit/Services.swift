//
//  Services.swift
//  xfit
//
//  Created by Dev1 on 3/10/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import Foundation

class Services {
    
    private var _title: String?
    
    private var _featuredImg: String?
    
    private var _content: String?
    
    private var _icon: String?
    
    private var _thumb: String?
    
    var title: String? {
        return _title
    }
    
    var content: String? {
        return _content
    }
    
    var featuredImg: String? {
        return _featuredImg
    }
    
    var icon: String? {
        return _icon
    }
    
    var thumb: String? {
        return _thumb
    }
    
    init (title: String?, content: String?, featuredImg: String?, icon: String?, thumb: String?) {
        self._title = title
        self._content = content
        self._featuredImg = featuredImg
        self._icon = icon
        self._thumb = thumb
    }
    
    init(dictionary: AnyObject) {
        
        if let title = dictionary["title"] as? String {
            self._title = title
        }
        
        if let content = dictionary["content"] as? String {
            self._content = content
        }
        
        if let featuredImg = dictionary["featuredImg"] as? String {
            self._featuredImg = featuredImg
        }
        
        if let icon = dictionary["icon"] as? String {
            self._icon = icon
        }
        
        if let thumb = dictionary["thumb"] as? String {
            self._thumb = thumb
        }
        
    }
    
}