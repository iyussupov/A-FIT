//
//  MainMenuVC.swift
//  xfit
//
//  Created by Dev1 on 3/9/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {
    
    @IBOutlet weak var scrllView: UIScrollView!
    
    @IBOutlet weak var scheduleView: UIView!
    
    @IBOutlet weak var newsView: UIView!
    
    @IBOutlet weak var aboutView: UIView!
    
    @IBOutlet weak var photoGalleryView: UIView!
    
    @IBOutlet weak var servicesView: UIView!
    
    @IBOutlet weak var trainersView: UIView!
    
    @IBOutlet weak var selfyView: UIView!
    
    @IBOutlet weak var contactsView: UIView!
    
    @IBOutlet weak var checkInView: UIView!
    
    @IBOutlet weak var profileView: UIView!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .BezelPanningCenterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        let scheduleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMenuVC.scheduleTapFunc))
        self.scheduleView.addGestureRecognizer(scheduleTap)
        
        let newsTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMenuVC.newsTapFunc))
        self.newsView.addGestureRecognizer(newsTap)
        
        let aboutTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMenuVC.aboutTapFunc))
        self.aboutView.addGestureRecognizer(aboutTap)
        
        let photoGalleryTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMenuVC.photoGalleryTapFunc))
        self.photoGalleryView.addGestureRecognizer(photoGalleryTap)
        
        let servicesTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMenuVC.servicesTapFunc))
        self.servicesView.addGestureRecognizer(servicesTap)
        
        let trainersTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMenuVC.trainersTapFunc))
        self.trainersView.addGestureRecognizer(trainersTap)
        
        let selfyTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMenuVC.selfyTapFunc))
        self.selfyView.addGestureRecognizer(selfyTap)
        
        let contactsTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMenuVC.contactsTapFunc))
        self.contactsView.addGestureRecognizer(contactsTap)
        
        let checkInTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMenuVC.checkInTapFunc))
        self.checkInView.addGestureRecognizer(checkInTap)
        
        let profileTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainMenuVC.profileTapFunc))
        self.profileView.addGestureRecognizer(profileTap)
        
    }
    
    func profileTapFunc() {
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func checkInTapFunc() {
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("CheckInVC") as! CheckInVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func contactsTapFunc() {
        
        self.contactsView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ContactsVC") as! ContactsVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func selfyTapFunc() {
        
        self.selfyView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("OurSelfyVC") as! OurSelfyVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func scheduleTapFunc() {
        
        self.scheduleView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("CalendarVC") as! CalendarVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func newsTapFunc() {
        
        self.newsView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("NewsVC") as! NewsVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func aboutTapFunc() {
        
        self.aboutView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("AboutVC") as! AboutVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func photoGalleryTapFunc() {
        
        self.photoGalleryView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("PhotoGalleryVC") as! PhotoGalleryVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func servicesTapFunc() {
        
        self.servicesView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ServicesVC") as! ServicesVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func trainersTapFunc() {
        
        self.trainersView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("TrainersVC") as! TrainersVC
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
