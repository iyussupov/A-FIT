//
//  Schedule.swift
//  xfit
//
//  Created by Dev1 on 3/12/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import Foundation

class Schedule {
    
    private var _title: String?
    
    private var _place: String?
    
    private var _content: String?
    
    private var _time: String?
    
    private var _duration: String?
    
    var title: String? {
        return _title
    }
    
    var content: String? {
        return _content
    }
    
    var place: String? {
        return _place
    }
    
    var time: String? {
        return _time
    }
    
    var duration: String? {
        return _duration
    }
    
    init (title: String?, content: String?, place: String?, time: String?, duration: String?) {
        self._title = title
        self._content = content
        self._place = place
        self._time = time
        self._duration = duration
    }
    
    init(dictionary: AnyObject) {
        
        if let title = dictionary["title"] as? String {
            self._title = title
        }
        
        if let content = dictionary["content"] as? String {
            self._content = content
        }
        
        if let place = dictionary["place"] as? String {
            self._place = place
        }
        
        if let time = dictionary["time"] as? String {
            self._time = time
        }
        
        if let duration = dictionary["duration"] as? String {
            self._duration = duration
        }
        
    }
    
}