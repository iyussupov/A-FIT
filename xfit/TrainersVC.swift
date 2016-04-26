//
//  TrainersVC.swift
//  xfit
//
//  Created by Dev1 on 3/10/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class TrainersVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
 
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .All
    }
    
    var trainers = [Trainers]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parseData()
    }

    func parseData() {
        
        
        let objects = [[
                "featuredImage":"trainer1",
                "name":"BILL BROOKS",
                "category":"COMBAT SPORTS",
                "content":"Combat sports coordinator in federal chain of fitness clubs A-FIT, master-trainer"
            ],[
                "featuredImage":"trainer2",
                "name":"POLINA RIVERA",
                "category":"PILATES AND STRETCH",
                "content":"Combat sports coordinator in federal chain of fitness clubs A-FIT, master-trainer"
            ],[
                "featuredImage":"trainer3",
                "name":"MAX HARRIS",
                "category":"STEP",
                "content":"Combat sports coordinator in federal chain of fitness clubs A-FIT, master-trainer"
            ],[
                "featuredImage":"trainer4",
                "name":"ALEX TAYLOR",
                "category":"FUNCTIONAL TRAINER",
                "content":"Combat sports coordinator in federal chain of fitness clubs A-FIT, master-trainer"
            ],[
                "featuredImage":"trainer5",
                "name":"JOHN MCCOY",
                "category":"TRX",
                "content":"Combat sports coordinator in federal chain of fitness clubs A-FIT, master-trainer"
            ],[
                "featuredImage":"trainer6",
                "name":"PAVEL PETRENKO",
                "category":"CYCLE",
                "content":"Combat sports coordinator in federal chain of fitness clubs A-FIT, master-trainer"
            ]]
        
        for object in objects {
            
            let trainer = Trainers(dictionary: object)
            
            self.trainers.append(trainer)
            
        }
        
        
        self.collection.reloadData()
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TrainersCell", forIndexPath: indexPath) as? TrainersCell {
            
            let trainer: Trainers!
            trainer = trainers[indexPath.row]
            
            cell.configureCell(trainer)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        let trainer = self.trainers[indexPath.row]
        performSegueWithIdentifier("TrainerDetailVC", sender: trainer)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return trainers.count
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(164, 200)
    }
    
    
    @IBAction func openMenu(sender: AnyObject) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
    
    @IBAction func openProfile(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(controller, animated: true)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TrainerDetailVC" {
            if let trainerDetailVC = segue.destinationViewController as? TrainerDetailVC {
                if let trainer = sender as? Trainers {
                    trainerDetailVC.trainer = trainer
                }
            }
        }
    }
    
    
}
