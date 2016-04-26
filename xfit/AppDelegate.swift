//
//  AppDelegate.swift
//  xfit
//
//  Created by Ingwar on 3/5/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit
import DrawerController
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var drawerController: DrawerController!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        Parse.setLogLevel(PFLogLevel.Info);
        
        let config = ParseClientConfiguration(block: {
            (ParseMutableClientConfiguration) -> Void in
            
            ParseMutableClientConfiguration.applicationId = "fitnessbeapp";
            ParseMutableClientConfiguration.clientKey = "igoryussupov1982";
            ParseMutableClientConfiguration.server = "http://162.243.217.181:1337/parse";
        });
        
        Parse.initializeWithConfiguration(config);
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        var centerViewController:UIViewController = UIViewController()
        
        centerViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LaunchVC") as! LaunchVC
        
        let leftSideNavController = mainStoryboard.instantiateViewControllerWithIdentifier("LeftSideVC") as! LeftSideVC
        
        let leftSideNav = UINavigationController(rootViewController: leftSideNavController)
        let centerNav = UINavigationController(rootViewController: centerViewController)
        
        self.drawerController = DrawerController(centerViewController: centerNav, leftDrawerViewController: leftSideNav)
        
        self.drawerController.showsShadows = true
        self.drawerController.maximumLeftDrawerWidth = 320.0
        self.drawerController.restorationIdentifier = "Drawer"
        self.drawerController.openDrawerGestureModeMask = .All
        self.drawerController.closeDrawerGestureModeMask = .All
        
        self.window?.rootViewController = self.drawerController
        self.window?.makeKeyAndVisible()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

