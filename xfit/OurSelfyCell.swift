//
//  OurSelfyCell.swift
//  xfit
//
//  Created by Dev1 on 3/11/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class OurSelfyCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImg: UIImageView!
    
    @IBOutlet weak var likesCountLbl: UILabel!
    
    @IBOutlet weak var commentCountLbl: UILabel!
    
    @IBOutlet weak var likesIcon: UILabel!
    
    private var _selfy: Selfy?
    
    var selfy: Selfy? {
        return _selfy
    }
    
    override func drawRect(rect: CGRect) {
        featuredImg.clipsToBounds = true
    }
    
    
    func configureCell(selfy:Selfy) {
        
        self._selfy = selfy
        
        if selfy.featuredImg != nil {
            self.featuredImg.image = UIImage(named: selfy.featuredImg!)
        } else {
            self.featuredImg.hidden = true
        }
        
        if let likesCount = selfy.likes_count {
            self.likesCountLbl.text = "\(likesCount)"
        } else {
            self.likesCountLbl.text = "0"
        }
        
        if let likes = selfy.likes where likes == true {
            self.likesIcon.text = ""
            self.likesIcon.textColor = UIColor(red: 118/255, green: 190/255, blue: 52/255, alpha: 1.0)
        }
        
        if let commentCount = selfy.comments_count {
            self.commentCountLbl.text = "\(commentCount)"
        } else {
            self.commentCountLbl.text = "0"
        }
    }
    
}
