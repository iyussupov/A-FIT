//
//  ServicesCell.swift
//  xfit
//
//  Created by Dev1 on 3/10/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class ServicesCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var iconImg: UIImageView!
    
    @IBOutlet weak var thumbImg: UIImageView!
    
    private var _services: Services?
    
    var services: Services? {
        return _services
    }
    
    override func drawRect(rect: CGRect) {
//        featuredImg.clipsToBounds = true
    }
    
    
    func configureCell(services: Services) {
        
        self._services = services
        
        if let serviceName = services.title where serviceName != "" {
            self.titleLbl.text = serviceName.uppercaseString
        } else {
            self.titleLbl.text = nil
        }
        
        if let serviceIcon = services.icon where serviceIcon != "" {
            self.iconImg.image = UIImage(named: serviceIcon)
        } else {
            self.iconImg.image = nil
        }
        
        if let thumbImg = services.thumb where thumbImg != "" {
            self.thumbImg.image = UIImage(named: thumbImg)
        } else {
            self.thumbImg.image = nil
        }
        
    }

}
