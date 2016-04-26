//
//  ServicesVC.swift
//  xfit
//
//  Created by Dev1 on 3/10/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class ServicesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
        
        @IBOutlet weak var tableView: UITableView!
        
        override func viewWillAppear(animated: Bool) {
            self.navigationController?.navigationBarHidden = true
            self.evo_drawerController?.openDrawerGestureModeMask = .All
        }
        
        var services = [Services]()
        var preventAnimation = Set<NSIndexPath>()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.dataSource = self
            tableView.delegate = self
            
//            tableView.estimatedRowHeight = tableView.rowHeight
//            tableView.rowHeight = UITableViewAutomaticDimension
            
            self.parseData()
        }
        
        func parseData() {
            
            
            let objects = [[
                "title":"SEAWATER SWIMMING POOL",
                    "icon":"icon-water",
                    "thumb":"service_thumb_1",
                    "featuredImg":"service_img_1,foto2,foto3",
                    "content":"A-FIT MONARCH is located in the historical center of London near the large traffic intersection. The presence of developed infrastructure makes it possible to attend not only fitness, but go for shopping too. In walking distance there is an airport terminal, where passengers can register for flights, hotel and many other essential services. The fitness club occupies a separate 4-storey building with area of over 4,000 square meters. Walk from the nearest metro station will take less than five minutes."
                
                ],[
                    "title":"GYM",
                    "icon":"icon-gym",
                    "thumb":"service_thumb_2",
                    "featuredImg":"foto4,foto5,foto6",
                    "content":"A-FIT MONARCH is located in the historical center of London near the large traffic intersection. The presence of developed infrastructure makes it possible to attend not only fitness, but go for shopping too. In walking distance there is an airport terminal, where passengers can register for flights, hotel and many other essential services. The fitness club occupies a separate 4-storey building with area of over 4,000 square meters. Walk from the nearest metro station will take less than five minutes."
                    
                ],[
                    "title":"3 GROUP CLASSES STUDIOS",
                    "icon":"icon-restl",
                    "thumb":"service_thumb_3",
                    "featuredImg":"foto7,foto2,foto3",
                    "content":"A-FIT MONARCH is located in the historical center of London near the large traffic intersection. The presence of developed infrastructure makes it possible to attend not only fitness, but go for shopping too. In walking distance there is an airport terminal, where passengers can register for flights, hotel and many other essential services. The fitness club occupies a separate 4-storey building with area of over 4,000 square meters. Walk from the nearest metro station will take less than five minutes."
                    
                ],[
                    "title":"CYCLE-STUDIO",
                    "icon":"icon-cycle",
                    "thumb":"service_thumb_4",
                    "featuredImg":"foto1,foto2,foto3",
                    "content":"A-FIT MONARCH is located in the historical center of London near the large traffic intersection. The presence of developed infrastructure makes it possible to attend not only fitness, but go for shopping too. In walking distance there is an airport terminal, where passengers can register for flights, hotel and many other essential services. The fitness club occupies a separate 4-storey building with area of over 4,000 square meters. Walk from the nearest metro station will take less than five minutes."
                    
                ],[
                    "title":"CHILDREN FITNESS",
                    "icon":"icon-child",
                    "thumb":"service_thumb_5",
                    "featuredImg":"foto4,foto5,foto6",
                    "content":"A-FIT MONARCH is located in the historical center of London near the large traffic intersection. The presence of developed infrastructure makes it possible to attend not only fitness, but go for shopping too. In walking distance there is an airport terminal, where passengers can register for flights, hotel and many other essential services. The fitness club occupies a separate 4-storey building with area of over 4,000 square meters. Walk from the nearest metro station will take less than five minutes."
                    
                ],[
                    "title":"FRESH FIT CAFE",
                    "icon":"icon-cafe",
                    "thumb":"service_thumb_6",
                    "featuredImg":"service_img_1",
                    "content":"A-FIT MONARCH is located in the historical center of London near the large traffic intersection. The presence of developed infrastructure makes it possible to attend not only fitness, but go for shopping too. In walking distance there is an airport terminal, where passengers can register for flights, hotel and many other essential services. The fitness club occupies a separate 4-storey building with area of over 4,000 square meters. Walk from the nearest metro station will take less than five minutes."
                    
                ],[
                    "title":"PERSONAL TRAININGS",
                    "icon":"icon-person",
                    "thumb":"service_thumb_7",
                    "featuredImg":"service_img_1",
                    "content":"A-FIT MONARCH is located in the historical center of London near the large traffic intersection. The presence of developed infrastructure makes it possible to attend not only fitness, but go for shopping too. In walking distance there is an airport terminal, where passengers can register for flights, hotel and many other essential services. The fitness club occupies a separate 4-storey building with area of over 4,000 square meters. Walk from the nearest metro station will take less than five minutes."
                    
                ]]
            
            for object in objects {
                
                let service = Services(dictionary: object)
                
                self.services.append(service)
                
            }
            
            
            self.tableView.reloadData()
        }

        
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return services.count
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let services = self.services[indexPath.row]
            
            if let cell = tableView.dequeueReusableCellWithIdentifier("ServicesCell") as? ServicesCell {
                
                cell.configureCell(services)
                
                return cell
                
            } else {
                return ServicesCell()
            }
            
        }
        
        func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
            if !preventAnimation.contains(indexPath) {
                preventAnimation.insert(indexPath)
                cell.alpha = 0
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    cell.alpha = 1
                })
            }
        }
    
        func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 84
        }
    
        func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 84
        }

        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            let news = self.services[indexPath.row]
            performSegueWithIdentifier("ServicesDetailVC", sender: news)
            
        }
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "ServicesDetailVC" {
                if let servicesDetailVC = segue.destinationViewController as? ServicesDetailVC {
                    if let services = sender as? Services {
                        servicesDetailVC.services = services
                    }
                }
            }
        }
        
        @IBAction func openMenu(sender: AnyObject) {
            self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
            
        }
        
        @IBAction func openProfile(sender: AnyObject) {
            let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        
}


