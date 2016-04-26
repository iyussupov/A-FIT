//
//  ScrollSubClass.swift
//  xfit
//
//  Created by Dev1 on 3/18/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class ScrollSubClass: UIScrollView {

    override func touchesShouldCancelInContentView(view: (UIView!)) -> Bool {
        if view is UIButton {
            return  true
        }
        return  super.touchesShouldCancelInContentView(view)
    }

}
