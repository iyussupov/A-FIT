//
//  CalendarVC.swift
//  xfit
//
//  Created by Dev1 on 3/12/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController, UITableViewDataSource, UITableViewDelegate, CalendarWeekViewControllerDelegate {

    var weekView: CalendarWeekViewControllerView?
    var selectedIndex = -1
    var results = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view, typically from a nib.
        weekView = CalendarWeekViewControllerView(frame: CGRectMake(16, 130, view.frame.width, 44))
        view.addSubview(weekView!)
        
        let calendarMenu = CalendarMenuView(frame: CGRectMake(4, 82, view.frame.width - 4, 22))
        view.addSubview(calendarMenu)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        weekView?.delegate = self
        
        self.parseData()
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(CalendarVC.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.tableView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(CalendarVC.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.tableView.addGestureRecognizer(swipeRight)

    }
    
    func daySelect() {
    }
    
    func nextWeekView() {}
    func prevWeekView(){}
    func afterAutoScroll(){}
    
    
    
    func toNextDay() {
        selectedIndex = -1
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        self.tableView.reloadSections(sections, withRowAnimation: .Left)
        
    }
    
    func toPrevDay() {
        selectedIndex = -1
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        self.tableView.reloadSections(sections, withRowAnimation: .Right)
    }
    
    func tapOnDay() {
        selectedIndex = -1
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        self.tableView.reloadSections(sections, withRowAnimation: .Left)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            if swipeGesture.direction == UISwipeGestureRecognizerDirection.Left {
                weekView!.scrollToNextDay()
            }
            
            if swipeGesture.direction == UISwipeGestureRecognizerDirection.Right {
                weekView!.scrollToPrevDay()
            }
        }
        
    }
    
//    func scrollToPrevDay(sender: UITapGestureRecognizer) {
//        print("prev")
//        weekView!.scrollToPrevDay()
//    }
//    
//    func scrollToNextDay(sender: UITapGestureRecognizer) {
//        print("next")
//        weekView!.scrollToNextDay()
//    }
        
        
        @IBOutlet weak var tableView: UITableView!
        
        override func viewWillAppear(animated: Bool) {
            self.navigationController?.navigationBarHidden = true
            self.evo_drawerController?.openDrawerGestureModeMask = .BezelPanningCenterView
        }
        
        var schedule = [Schedule]()
        var preventAnimation = Set<NSIndexPath>()
    
        
        func parseData() {            
            let objects = [[
                    "title":"HEART-X",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"SWIMMING POOL",
                    "time":"07:30",
                    "duration":"45 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"09:00",
                    "duration":"55 МИН."
                ],[
                    "title":"PILATES MAT",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"10:00",
                    "duration":"55 МИН."
                ],[
                    "title":"HANDMADE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"CHILDREN STUDIO",
                    "time":"11:00",
                    "duration":"30 МИН."
                ],[
                    "title":"X-PUMP",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"11:30",
                    "duration":"55 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"12:00",
                    "duration":"55 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"12:30",
                    "duration":"55 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"12:30",
                    "duration":"55 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"13:00",
                    "duration":"55 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"13:30",
                    "duration":"55 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"13:30",
                    "duration":"55 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"14:00",
                    "duration":"55 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"14:30",
                    "duration":"55 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"15:00",
                    "duration":"55 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"15:30",
                    "duration":"55 МИН."
                ],[
                    "title":"LOW CORE",
                    "content":"It’s been proved that water exercises perfectly train the entire body. We have developed a program that emphasizes the loading on the most important organ of our body - the heart. Regularly visiting  A-HEART, you will feel how much easier it was to carry the daily burden. Training takes place with special equipment (belts, gloves).",
                    "place":"STUDIO 1",
                    "time":"16:00",
                    "duration":"55 МИН."
                ]]
            
            for object in objects {
                
                let schedule = Schedule(dictionary: object)
                
                self.schedule.append(schedule)
                
            }
            
            
            self.tableView.reloadData()
        }
        
        
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return schedule.count
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let schedule = self.schedule[indexPath.row]
            
            if let cell = tableView.dequeueReusableCellWithIdentifier("ScheduleCell") as? ScheduleCell {
                
                cell.configureCell(schedule)
                
                return cell
                
            } else {
                return ScheduleCell()
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
            return tableView.rowHeight
        }

    
        func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            if selectedIndex == indexPath.row {
                return UITableViewAutomaticDimension
            } else {
                return 58
            }
        }
    
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            if selectedIndex == indexPath.row {
                selectedIndex = -1
                tableView.beginUpdates()
                tableView.endUpdates()
            } else
            
            if selectedIndex != -1 {
                selectedIndex = indexPath.row
                tableView.beginUpdates()
                tableView.endUpdates()
            } else {
            
                selectedIndex = indexPath.row
                tableView.beginUpdates()
                tableView.endUpdates()
            
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



