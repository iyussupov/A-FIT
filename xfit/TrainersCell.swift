//
//  TrainersCell.swift
//  xfit
//
//  Created by Dev1 on 3/10/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class TrainersCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImg: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var categoryLbl: UILabel!
    
    
    private var _trainers: Trainers?
    
    var trainers: Trainers? {
        return _trainers
    }
    
    override func drawRect(rect: CGRect) {
        featuredImg.clipsToBounds = true
    }
    
    
    func configureCell(trainers: Trainers) {
        
        self._trainers = trainers
        
        if let trainerName = trainers.name where trainerName != "" {
            self.nameLbl.text = trainerName.uppercaseString
        } else {
            self.nameLbl.text = nil
        }
        
        if let category = trainers.category where category != "" {
            self.categoryLbl.text = "\(category.uppercaseString)"
            if category == "Offers" {
                self.categoryLbl.backgroundColor = UIColor(red: 118.0/255.0, green: 190.0/255.0, blue: 52.0/255.0, alpha: 1.0)
                self.categoryLbl.layer.borderColor = UIColor(red: (118.0/255.0), green: (190.0/255.0), blue: (52.0/255.0), alpha: 1.0).CGColor
            }
        } else {
            self.categoryLbl.hidden = true
        }
        
        if trainers.featuredImg != nil {
            self.featuredImg.image = UIImage(named: trainers.featuredImg!)
        } else {
            self.featuredImg.hidden = true
        }
        
    }
    
}
