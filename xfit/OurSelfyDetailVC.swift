//
//  OurSelfyDetailVC.swift
//  xfit
//
//  Created by Dev1 on 3/11/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class OurSelfyDetailVC: UIViewController, UIScrollViewDelegate {
        
        var selfy: Selfy!
        var toggleRightDrawer: Bool?
        static var imageCache = NSCache()
        var preventAnimation = Set<NSIndexPath>()
    
        @IBOutlet weak var headerImage: UIImageView!
        @IBOutlet var scrollView:UIScrollView!
        @IBOutlet weak var nameLbl: UILabel!
        
        @IBOutlet weak var imageViewer: UIView!
    
        @IBOutlet weak var likesCountLbl: UILabel!
    
        @IBOutlet weak var commentCountLbl: UILabel!
    
        @IBOutlet weak var likesIcon: UILabel!
        
        override func viewWillAppear(animated: Bool) {
            self.navigationController?.navigationBarHidden = true
            self.evo_drawerController?.openDrawerGestureModeMask = .Custom
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            scrollView.delegate = self
            self.updateUI()
        }
        
        
        
        func updateUI() {
            
            nameLbl.text = selfy.name?.uppercaseString
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 8
            
//            if let contentString = selfy.content {
//                
//                let attrString = NSMutableAttributedString(string: contentString)
//                attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
////                self.contentField.attributedText = attrString
//                
//            }
            
            if let url = selfy.featuredImg {
                self.headerImage.image = UIImage(named: url)
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
        
        override func viewDidAppear(animated: Bool) {
            
            headerImage.clipsToBounds = true
            
        }
        
        
        func scrollViewDidScroll(scrollView: UIScrollView) {
            
            let offset = scrollView.contentOffset.y
            var headerTransform = CATransform3DIdentity
            var labelsTransform = CATransform3DIdentity
            
            // PULL DOWN -----------------
            
            if offset < 0 {
                
                let headerScaleFactor:CGFloat = -(offset) / headerImage.bounds.height
                let headerSizevariation = ((headerImage.bounds.height * (1.0 + headerScaleFactor)) - headerImage.bounds.height)/2.0
                headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
                headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
                
                labelsTransform = CATransform3DTranslate(labelsTransform, 0, offset, 0)
                
                headerImage.layer.transform = headerTransform
            }
                
                // SCROLL UP/DOWN ------------
                
            else {
                
                // Header -----------
                
                headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)
                labelsTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)
                
            }
            
            // Apply Transformations
            
            headerImage.layer.transform = headerTransform
        }
    
    
        
        @IBAction func DetailsBackBtn(sender: AnyObject) {
            
            if toggleRightDrawer != true {
                self.navigationController?.popViewControllerAnimated(true)
            } else {
                self.evo_drawerController?.toggleRightDrawerSideAnimated(true, completion: nil)
            }
        }
        
        
        @IBAction func openProfile(sender: AnyObject) {
            let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        
}


