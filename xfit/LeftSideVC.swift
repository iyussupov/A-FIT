//
//  LeftSideVC.swift
//  xfit
//
//  Created by Dev1 on 3/9/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class LeftSideVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var menuItems:[String] = ["HOME","PERSONAL ACCOUNT","SCHEDULE","NEWS / OFFERS","CHECK-IN","ABOUT US","PHOTO TOUR","SERVICES","TRAINERS","OUR FAMILY","GUESTBOOK","CONTACTS"];
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        //
        self.navigationController?.view.setNeedsLayout()
        //
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuItems.count;
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 48.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as! MenuCell
        
        cell.menuItemLbl.text = menuItems[indexPath.row].uppercaseString
        
        if indexPath.row == menuItems.count - 1 {
//            cell.cellSeparatorView.hidden = true
        }
        
        return cell;
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
//        for var index = 0; index <= menuItems.count; ++index {
//            let tempindexpath =  NSIndexPath(forRow: index, inSection: 0)
//            let cell = tableView.cellForRowAtIndexPath(tempindexpath)
//            cell?.backgroundColor = UIColor(red: 118/255, green: 190/255, blue: 52/255, alpha: 0.0)
//        }
//        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.backgroundColor = UIColor(red: 118/255, green: 190/255, blue: 52/255, alpha: 0.0)

        
        switch(indexPath.row)  {
            
        case 0:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuVC") as! MainMenuVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 1:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 2:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CalendarVC") as! CalendarVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 3:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("NewsVC") as! NewsVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 4:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CheckInVC") as! CheckInVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;

        case 5:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AboutVC") as! AboutVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 6:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PhotoGalleryVC") as! PhotoGalleryVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 7:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ServicesVC") as! ServicesVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 8:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TrainersVC") as! TrainersVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 9:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("OurSelfyVC") as! OurSelfyVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 11:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContactsVC") as! ContactsVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        default:
            
            print("\(menuItems[indexPath.row]) is selected");
            
        }
        
    }
    
    
    
}

