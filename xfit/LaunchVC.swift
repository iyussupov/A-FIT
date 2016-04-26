//
//  LaunchVC.swift
//  xfit
//
//  Created by Dev1 on 3/15/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//
import UIKit
import AVFoundation

class LaunchVC: UIViewController, AVAudioPlayerDelegate {
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .Custom
    }
    
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let resourcePath = NSBundle.mainBundle().pathForResource("soundxfit", ofType: "mp3")!
            let url = NSURL(fileURLWithPath: resourcePath)
            try musicPlayer = AVAudioPlayer(contentsOfURL: url)
            
            
            musicPlayer.delegate = self
            musicPlayer.numberOfLoops = 0
            musicPlayer.prepareToPlay()
            musicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
                let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuVC") as! MainMenuVC
                let centerNav = UINavigationController(rootViewController: centerViewController)
        
                let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.drawerController!.centerViewController = centerNav
    }
    
}