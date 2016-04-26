//
//  PanelsViewBorder.swift
//  xfit
//
//  Created by Ingwar on 3/5/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class PanelsViewBorder: UIView {

    override func awakeFromNib() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: (97/255.0), green: (97/255.0), blue: (97/255.0), alpha: 1.0).CGColor
    }

}
