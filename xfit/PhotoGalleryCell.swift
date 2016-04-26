//
//  PhotoGalleryCell.swift
//  xfit
//
//  Created by Dev1 on 3/11/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class PhotoGalleryCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImg: UIImageView!
    
    override func drawRect(rect: CGRect) {
        featuredImg.clipsToBounds = true
    }
    
    
    func configureCell(image:String) {
        
        if image != "" {
            self.featuredImg.image = UIImage(named: image)
        } else {
            self.featuredImg.hidden = true
        }
    }
        
}
