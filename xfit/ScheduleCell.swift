//
//  ScheduleCell.swift
//  xfit
//
//  Created by Dev1 on 3/12/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class ScheduleCell: UITableViewCell {
        
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var contentWrap: UIView!
    @IBOutlet weak var contentLbl: UILabel!
        
        private var _schedule: Schedule?
        
        var schedule: Schedule? {
            return _schedule
        }
        
        override func drawRect(rect: CGRect) {
            //        featuredImg.clipsToBounds = true
        }
    
        
        func configureCell(schedule: Schedule) {
            
            
            
            
            let sportTypes = [[
                
                "types":"HEART-X PRO",
                "place":"SWIMMING POOL"],[
                "types":"HEART-X",
                "place":"SWIMMING POOL"],[
                "types":"BODY FIT",
                "place":"SWIMMING POOL"],[
                "types":"LOW CORE",
                "place":"STUDIO 1"],[
                "types":"BODY ROCK",
                "place":"SWIMMING POOL"],[
                "types":"X-RACE PRO",
                "place":"STUDIO 2"],[
                "types":"STREET FIGHT",
                "place":"STUDIO 1"],[
                "types":"X-PUMP",
                "place":"STUDIO 1"],[
                "types":"ATLETICA",
                                                "place":"SWIMMING POOL"],[
                                                    "types":"X-RACE AIR",
                                                    "place":"STUDIO 2"],[
                                                        "types":"WHITE COLLARS FUN",
                                                        "place":"RING"],[
                                                            "types":"PILATES MAT",
                                                            "place":"STUDIO 1"],[
                                                                "types":"INTRO",
                                                                "place":"SWIMMING POOL"],[
                                                                    "types":"BODY&MIND",
                                                                    "place":"STUDIO 1"],[
                                                                        "types":"YOGA (HIMALAYAN)",
                                                                        "place":"STUDIO 1"],[
                                                                            "types":"HANDMADE",
                                                                            "place":"CHILDREN STUDIO"],[
                                                                                "types":"LOGORITHMIKA",
                                                                                "place":"CHILDREN STUDIO"]
                
            ]

            
            
            self._schedule = schedule
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 8
            
            if let content = schedule.content where content != "" {
                
                let attrString = NSMutableAttributedString(string: content)
                attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
                self.contentLbl.attributedText = attrString
                
            } else {
                self.contentLbl.text = nil
            }
            
            if let time = schedule.time where time != "" {
                self.timeLbl.text = time.uppercaseString
            } else {
                self.timeLbl.text = nil
            }
            
            if let duration = schedule.duration where duration != "" {
                self.durationLbl.text = duration.uppercaseString
            } else {
                self.durationLbl.text = nil
            }
            
            
            let randomIndex = Int(arc4random_uniform(UInt32(sportTypes.count)))
            
            
            self.titleLbl.text = "\(sportTypes[randomIndex]["types"]!)"
            self.placeLbl.text = "\(sportTypes[randomIndex]["place"]!)"
            
        }
        
}
