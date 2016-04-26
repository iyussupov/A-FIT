//
//  NewsCell.swift
//  xfit
//
//  Created by Ingwar on 3/5/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
        
        @IBOutlet weak var featuredImg: UIImageView!
    
        @IBOutlet weak var titleLbl: UILabel!
        
        @IBOutlet weak var categoryLbl: UILabel!
        
        @IBOutlet weak var dateLbl: UILabel!
        
        @IBOutlet weak var commentCount: UILabel!
        
        @IBOutlet weak var cellFooterView: UIView!
        
        
        private var _news: News?
    
        var news: News? {
            return _news
        }
    
        override func drawRect(rect: CGRect) {
            featuredImg.clipsToBounds = true
        }
    
        
        func configureCell(news: News, img: UIImage?) {
            
            self._news = news
            
            if let title = news.title where title != "" {
                self.titleLbl.text = title.uppercaseString
            } else {
                self.titleLbl.text = nil
            }
            
            if let category = news.category where category != "" {
                self.categoryLbl.text = "\(category.uppercaseString)"
                if category == "Offers" {
                    self.categoryLbl.backgroundColor = UIColor(red: 118.0/255.0, green: 190.0/255.0, blue: 52.0/255.0, alpha: 1.0)
                    self.categoryLbl.layer.borderColor = UIColor(red: (118.0/255.0), green: (190.0/255.0), blue: (52.0/255.0), alpha: 1.0).CGColor
                } 
            } else {
                self.categoryLbl.hidden = true
            }
            
            if let date = news.date where date != "" {
                
                let Date:NSDateFormatter = NSDateFormatter()
                Date.dateFormat = "dd.MM.yyyy"
                self.dateLbl.text = Date.stringFromDate(date)
                
            }
            
            if news.featuredImg != nil {
                self.featuredImg.image = UIImage(named: news.featuredImg!)
            } else {
                self.featuredImg.hidden = true
            }
            
            if let commentCount = news.commentCount {
                if commentCount == 1 {
                    self.commentCount.text = "\(commentCount) comment"
                } else if commentCount == 2 {
                    self.commentCount.text = "\(commentCount) comments"
                } else {
                    self.commentCount.text = "\(commentCount) comments"
                }
            } 
            
        }
        
        
//        @IBOutlet weak var postShareHover: RoundBtnViewStyle!
//        
//        @IBAction func postShareDown(sender: AnyObject) {
//            self.postShareHover.backgroundColor = UIColor(red: 136/255, green: 38/255, blue: 147/255, alpha: 1)
//        }
//        
//        @IBAction func postShareAction(sender: AnyObject) {
//            self.postShareHover.backgroundColor = UIColor(red: 175/255, green: 70/255, blue: 187/255, alpha: 1)
//            
//            var textToShare = ""
//            
//            if let title = post!.title where title != "" {
//                textToShare = "\(post!.title!)"
//            }
//            
//            
//            if let myWebsite = NSURL(string: "http://")
//            {
//                let objectsToShare = [textToShare, myWebsite]
//                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
//                
//                //New Excluded Activities Code
//                activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
//                //
//                
//                // self.presentViewController(activityVC, animated: true, completion: nil)
//                UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(activityVC, animated: true, completion: nil)
//            }
//            
//            
//        }
    
}
