//
//  CheckInVC.swift
//  xfit
//
//  Created by Ingwar on 3/17/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class CheckInVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    var PhotoWrapper: UIView!
    @IBOutlet weak var PhotoView: UIView!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var CheckInImage: UIImageView!
    @IBOutlet weak var addPhotoLbl: UILabel!
    
    @IBOutlet weak var gotoHome: UIView!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .All
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 0.17).CGColor
        
        let gotoHomeTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CheckInVC.gotoHomeTapFunc))
        self.gotoHome.addGestureRecognizer(gotoHomeTap)
        
    }
    
    func gotoHomeTapFunc() {
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuVC") as! MainMenuVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        
        
        self.CheckInImage.image = image
        self.addPhotoLbl.text = "EDIT"
//        self.PhotoView.frame = CGRectMake(0 , 0, self.PhotoView.frame.width, self.PhotoView.frame.height + 40)
        
    }
    
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func openMenu(sender: AnyObject) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
        
    }
    
    @IBAction func openProfile(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    

}
