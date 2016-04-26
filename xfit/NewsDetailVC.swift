//
//  NewsDetailVC.swift
//  xfit
//
//  Created by Ingwar on 3/6/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

let offset_HeaderStop:CGFloat = 243.0 // At this offset the Header stops its transformations

class NewsDetailVC: UIViewController, UIScrollViewDelegate  {
    
        var news: News!
        var toggleRightDrawer: Bool?
        static var imageCache = NSCache()
        var preventAnimation = Set<NSIndexPath>()
    
        @IBOutlet weak var headerTitle: UILabel!
        @IBOutlet weak var headerImage: UIImageView!
        @IBOutlet var scrollView:UIScrollView!
        @IBOutlet weak var postDate: UILabel!
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
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(NewsDetailVC.showImageViewer))
            imageViewer.addGestureRecognizer(tap)
            
        }
        
        func showImageViewer() {
            let img = news.featuredImg
            performSegueWithIdentifier("ViewerVC", sender: img)
        }
    
        
        
        func updateUI() {
            
            let Date:NSDateFormatter = NSDateFormatter()
            Date.dateFormat = "dd.MM.yyyy"
//            postDate.text = Date.stringFromDate(news.date!)
            
            titleLbl.text = news.title?.uppercaseString
            headerTitle.text = news.title?.uppercaseString
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 8
            
            if let contentString = news.content {
                
                let attrString = NSMutableAttributedString(string: contentString)
                attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
                self.contentField.attributedText = attrString
                
            }
            
            if let category = news.category where category != "" {
                self.categoryLbl.text = "\(category.uppercaseString)"
                self.categoryLbl.backgroundColor = UIColor(red: 118.0/255.0, green: 190.0/255.0, blue: 52.0/255.0, alpha: 1.0)
                self.categoryLbl.layer.borderColor = UIColor(red: (118.0/255.0), green: (190.0/255.0), blue: (52.0/255.0), alpha: 1.0).CGColor
            } else {
                self.categoryLbl.hidden = true
            }
            
            if let url = news.featuredImg {
                self.headerImage.image = UIImage(named: url)
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
                categoryLbl.layer.transform = labelsTransform
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
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
//            sizeHeaderToFit()
        }
        
//        func sizeHeaderToFit() {
//            let headerView = tableView.tableHeaderView!
//            
//            headerView.setNeedsLayout()
//            headerView.layoutIfNeeded()
//            
//            let height = headerView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
//            var frame = headerView.frame
//            frame.size.height = height
//            headerView.frame = frame
//            
//            tableView.tableHeaderView = headerView
//        }
    
        @IBAction func postShareAction(sender: AnyObject) {
            
            var textToShare = ""
            
            if let title = news!.title where title != "" {
                textToShare = "\(news!.title!)"
            }
            
            if let myWebsite = NSURL(string: "")
            {
                let objectsToShare = [textToShare, myWebsite]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                
                //New Excluded Activities Code
                activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
                //
                
                self.presentViewController(activityVC, animated: true, completion: nil)
            }
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

