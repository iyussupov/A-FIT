//
//  AboutVC.swift
//  xfit
//
//  Created by Dev1 on 3/11/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit
import ImageSlideshow

class AboutVC: UIViewController {
    
    @IBOutlet weak var contentField: UILabel!
    @IBOutlet var slideshow: ImageSlideshow!
    var transitionDelegate: ZoomAnimatedTransitioningDelegate?
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .All
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        if let contentString = self.contentField.text {
            
            let attrString = NSMutableAttributedString(string: contentString)
            attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
            self.contentField.attributedText = attrString
            
        }
        
        slideshow.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.0);
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.InsideScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor(red: 253/255, green: 218/255, blue: 0/255, alpha: 1.0);
        slideshow.pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        slideshow.contentScaleMode = UIViewContentMode.ScaleToFill
        
        slideshow.setImageInputs([ImageSource(imageString: "foto1")!, ImageSource(imageString: "foto5")!, ImageSource(imageString: "foto3")!, ImageSource(imageString: "foto4")!])
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(AboutVC.click))
        slideshow.addGestureRecognizer(recognizer)
        
    }

    @IBAction func openMenu(sender: AnyObject) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
        
    }
    
    @IBAction func openProfile(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func click() {
        let ctr = FullScreenSlideshowViewController()
        ctr.pageSelected = {(page: Int) in
            self.slideshow.setScrollViewPage(page, animated: false)
        }
        
        ctr.initialPage = slideshow.scrollViewPage
        ctr.inputs = slideshow.images
        self.transitionDelegate = ZoomAnimatedTransitioningDelegate(slideshowView: slideshow);
        ctr.transitioningDelegate = self.transitionDelegate!
        self.presentViewController(ctr, animated: true, completion: nil)
    }

}
