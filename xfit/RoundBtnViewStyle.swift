//
//  RoundBtnViewStyle.swift
//  xfit
//
//  Created by Ingwar on 3/5/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class RoundBtnViewStyle: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 24.5
        layer.shadowColor = UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 0.3).CGColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSizeMake(0.0, 4.0)
    }

}
