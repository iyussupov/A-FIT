//
//  OurSelfyVC.swift
//  xfit
//
//  Created by Dev1 on 3/11/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class OurSelfyVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        @IBOutlet weak var collection: UICollectionView!
        
        override func viewWillAppear(animated: Bool) {
            self.navigationController?.navigationBarHidden = true
            self.evo_drawerController?.openDrawerGestureModeMask = .All
        }
        
        var selfy = [Selfy]()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            parseData()
        }
        
        func parseData() {
            
                    let objects = [[
                        "featuredImg":"i1",
                        "name":"MARIA CODANA",
                        "likes_count":120,
                        "likes":true,
                        "comments_count":10
                    ],[
                        "featuredImg":"i2",
                        "name":"ALENA BORODINA",
                        "likes_count":90,
                        "comments_count":17
                    ],[
                        "featuredImg":"i3",
                        "name":"ALENA BORODINA",
                        "likes_count":10,
                        "likes":true,
                        "comments_count":32
                    ],[
                        "featuredImg":"i4",
                        "name":"ALENA BORODINA",
                        "likes_count":20,
                        "comments_count":18
                    ],[
                        "featuredImg":"i5",
                        "name":"ALENA BORODINA",
                        "likes_count":78,
                        "comments_count":14
                    ],[
                        "featuredImg":"i6",
                        "name":"ALENA BORODINA",
                        "likes_count":90,
                        "likes":true,
                        "comments_count":1
                    ],[
                        "featuredImg":"i7",
                        "name":"ALENA BORODINA",
                        "likes_count":114,
                        "likes":true,
                        "comments_count":22
                    ],[
                        "featuredImg":"i8",
                        "name":"ALENA BORODINA",
                        "likes_count":176,
                        "comments_count":16
                        ],[
                            "featuredImg":"i1",
                            "name":"MARIA CODANA",
                            "likes_count":120,
                            "likes":true,
                            "comments_count":10
                        ],[
                            "featuredImg":"i2",
                            "name":"ALENA BORODINA",
                            "likes_count":90,
                            "comments_count":17
                        ],[
                            "featuredImg":"i3",
                            "name":"ALENA BORODINA",
                            "likes_count":10,
                            "likes":true,
                            "comments_count":32
                        ],[
                            "featuredImg":"i4",
                            "name":"ALENA BORODINA",
                            "likes_count":20,
                            "comments_count":18
                        ],[
                            "featuredImg":"i5",
                            "name":"ALENA BORODINA",
                            "likes_count":78,
                            "comments_count":14
                        ],[
                            "featuredImg":"i6",
                            "name":"ALENA BORODINA",
                            "likes_count":90,
                            "likes":true,
                            "comments_count":1
                        ],[
                            "featuredImg":"i7",
                            "name":"ALENA BORODINA",
                            "likes_count":114,
                            "likes":true,
                            "comments_count":22
                        ],[
                            "featuredImg":"i8",
                            "name":"ALENA BORODINA",
                            "likes_count":176,
                            "comments_count":16
                        ]]
            
            for object in objects {
                
                let selfi = Selfy(dictionary: object)
                
                self.selfy.append(selfi)
                
            }
            
            self.collection.reloadData()
        }
    
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            
            let selfy = self.selfy[indexPath.row]
            
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("OurSelfyCell", forIndexPath: indexPath) as? OurSelfyCell {
                
                
                cell.configureCell(selfy)
                
                return cell
            } else {
                return UICollectionViewCell()
            }
        }
        
        func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            
            let selfy = self.selfy[indexPath.row]
            performSegueWithIdentifier("OurSelfyDetailVC", sender: selfy)
            
        }
        
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return self.selfy.count
            
        }
        
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            
            let screenWidth = (screenSize.width - 40)/2 - 1
            
            return CGSizeMake(screenWidth, screenWidth)
        }
        
        
        @IBAction func openMenu(sender: AnyObject) {
            self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
        }
        
        @IBAction func openProfile(sender: AnyObject) {
            let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "OurSelfyDetailVC" {
                if let detailVC = segue.destinationViewController as? OurSelfyDetailVC {
                    if let selfy = sender as? Selfy {
                        detailVC.selfy = selfy
                    }
                }
            }
        }
        
        
}