//
//  PhotoGalleryVC.swift
//  xfit
//
//  Created by Dev1 on 3/11/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit
import ImageSlideshow

class PhotoGalleryVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        @IBOutlet weak var collection: UICollectionView!
    
        @IBOutlet weak var slideshow: ImageSlideshow!
    
        var transitionDelegate: ZoomAnimatedTransitioningDelegate?
    
        let images = ["tur1","tur2","tur3","tur4","tur5","tur6","tur7","tur8","tur9","tur10","tur11","tur12","tur13","tur14","tur15","tur1","tur2","tur3","tur4","tur5","tur6","tur7","tur8","tur9","tur10","tur11","tur12","tur13","tur14","tur15"]
    
        override func viewWillAppear(animated: Bool) {
            self.navigationController?.navigationBarHidden = true
            self.evo_drawerController?.openDrawerGestureModeMask = .All
        }
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            parseData()
            
            var imageSet = [InputSource]()
            for item in images {
                let itemSourse = ImageSource(imageString: item)!
                imageSet.append(itemSourse)
                
            }
            slideshow.setImageInputs(imageSet)
        }
        
        func parseData() {
            
            
            self.collection.reloadData()
        }
        
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoGalleryCell", forIndexPath: indexPath) as? PhotoGalleryCell {
               
                let image = images[indexPath.row]
                
                cell.configureCell(image)
                
                return cell
            } else {
                return UICollectionViewCell()
            }
        }
        
        func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            
            let ctr = FullScreenSlideshowViewController()
            self.slideshow.setScrollViewPage(indexPath.row + 1, animated: false)
            ctr.slideshow.pageControlPosition = PageControlPosition.Hidden
            ctr.initialPage = slideshow.scrollViewPage
            ctr.inputs = slideshow.images
            self.transitionDelegate = ZoomAnimatedTransitioningDelegate(slideshowView: slideshow);
            ctr.transitioningDelegate = self.transitionDelegate!
            self.presentViewController(ctr, animated: true, completion: nil)
            
        }
        
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return self.images.count
            
        }
        
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            
            let screenWidth = (screenSize.width - 48)/3 - 2
            
            return CGSizeMake(screenWidth, screenWidth)
        }
        
        
        @IBAction func openMenu(sender: AnyObject) {
            self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
        }
        
        @IBAction func openProfile(sender: AnyObject) {
            let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
    
    
    
}

