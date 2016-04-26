//
//  NewsCategories.swift
//  xfit
//
//  Created by Ingwar on 3/6/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import Foundation

class Category {
    
    private var _categoryName: String?
    private var _categoryId: String?
    
    var categoryName: String? {
        return _categoryName
    }
    
    var categoryId: String? {
        return _categoryId
    }
    
    init (categoryName: String?) {
        self._categoryName = categoryName
    }
    
    init(categoryId: String, dictionary: AnyObject) {
        
        self._categoryId = categoryId
        
        if let categoryName = dictionary["categoryName"] as? String {
            self._categoryName = categoryName
        }
        
    }
}

