//
//  TrainerDetailVC.swift
//  xfit
//
//  Created by Dev1 on 3/10/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class TrainerDetailVC: UIViewController, UIScrollViewDelegate {
        
        var trainer: Trainers!
        var toggleRightDrawer: Bool?
        var preventAnimation = Set<NSIndexPath>()
        
        @IBOutlet weak var headerTitle: UILabel!
        @IBOutlet weak var headerImage: UIImageView!
        @IBOutlet var scrollView:UIScrollView!
        @IBOutlet weak var titleLbl: UILabel!
        @IBOutlet weak var contentField: UILabel!
        
        @IBOutlet weak var imageViewer: UIView!
        
        @IBOutlet weak var categoryLbl: UILabel!
        @IBOutlet weak var backBtnView: UIButton!
        
        @IBOutlet weak var tableView: UITableView!
        
        override func viewWillAppear(animated: Bool) {
            self.navigationController?.navigationBarHidden = true
            self.evo_drawerController?.openDrawerGestureModeMask = .Custom
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            scrollView.delegate = self
            self.updateUI()
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(TrainerDetailVC.showImageViewer))
            imageViewer.addGestureRecognizer(tap)
            
        }
        
        func showImageViewer() {
            let img = trainer.featuredImg
            performSegueWithIdentifier("ViewerVC", sender: img)
        }
        
        
        
        func updateUI() {
            
            titleLbl.text = trainer.name?.uppercaseString
            headerTitle.text = trainer.name?.uppercaseString
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 8
            
            if let contentString = trainer.content {
                
                let attrString = NSMutableAttributedString(string: contentString)
                attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
                self.contentField.attributedText = attrString
                
            }
            
            if let url = trainer.featuredImg {
                self.headerImage.image = UIImage(named: url)
            }
            
        }
        
        override func viewDidAppear(animated: Bool) {
            
            headerImage.clipsToBounds = true
            
        }
        
        
        func scrollViewDidScroll(scrollView: UIScrollView) {
            
            let offset = scrollView.contentOffset.y
            var headerTransform = CATransform3DIdentity
            
            // PULL DOWN -----------------
            
            if offset < 0 {
                
                let headerScaleFactor:CGFloat = -(offset) / headerImage.bounds.height
                let headerSizevariation = ((headerImage.bounds.height * (1.0 + headerScaleFactor)) - headerImage.bounds.height)/2.0
                headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
                headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
                
                headerImage.layer.transform = headerTransform
            }
                
                // SCROLL UP/DOWN ------------
                
            else {
                
                // Header -----------
                
                headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)
                
            }
            
            // Apply Transformations
            
            headerImage.layer.transform = headerTransform
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        }
    
        @IBAction func DetailsBackBtn(sender: AnyObject) {
            
            if toggleRightDrawer != true {
                self.navigationController?.popViewControllerAnimated(true)
            } else {
                self.evo_drawerController?.toggleRightDrawerSideAnimated(true, completion: nil)
            }
        }
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "ViewerVC" {
                if let viewerVC = segue.destinationViewController as? ViewerVC {
                    if let img = sender as? String {
                        viewerVC.img = img
                    }
                }
            }
        }
        
        @IBAction func openProfile(sender: AnyObject) {
            let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        
}


