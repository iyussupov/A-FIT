//
//  ProfileVC.swift
//  xfit
//
//  Created by Dev1 on 3/9/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .All
    }

    @IBOutlet weak var addTwitterWrapper: PanelsViewBorder!
    @IBOutlet weak var addFacebookWrapper: PanelsViewBorder!
    @IBOutlet weak var addFacebook: UIStackView!
    @IBOutlet weak var addTwitter: UIStackView!
    @IBOutlet weak var facebookBonusLbl: UILabel!
    @IBOutlet weak var twitterBonusLbl: UILabel!
    @IBOutlet weak var totalBonusesLbl: UILabel!
    @IBOutlet weak var facebookAddingLbl: UILabel!
    @IBOutlet weak var twitterAddingLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let facebookTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.addFacebookFunc(_:)))
        self.addFacebookWrapper.addGestureRecognizer(facebookTap)
        
        let twitterTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.addTwitterFunc(_:)))
        self.addTwitterWrapper.addGestureRecognizer(twitterTap)
        
    }
    
    func addFacebookFunc(tap:UITapGestureRecognizer) {
        
        let currentBonus = Int(self.totalBonusesLbl.text!)! + 10
        
        self.totalBonusesLbl.text = "\(currentBonus)"
        
        self.addFacebook.alpha = 1.0
        
        self.facebookBonusLbl.hidden = true
        
        self.facebookAddingLbl.text = "CONNECTED"
        
        self.addFacebookWrapper.removeGestureRecognizer(tap)
    }
    
    func addTwitterFunc(tap:UITapGestureRecognizer) {
        
        let currentBonus = Int(self.totalBonusesLbl.text!)! + 10
        
        self.totalBonusesLbl.text = "\(currentBonus)"
        
        self.addTwitter.alpha = 1.0
        
        self.twitterBonusLbl.hidden = true
        
        self.twitterAddingLbl.text = "CONNECTED"
        
        self.addTwitterWrapper.removeGestureRecognizer(tap)
    }

    @IBAction func openMenu(sender: AnyObject) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
        
    }
    
}
