//
//  CalendarDayView.swift
//

import UIKit
protocol CalendarDayViewDelegate {
    func selectedDay(dayView: CalendarDayView)
    func unSelectedDay(dayView: CalendarDayView)
    func tapOnDay()
}

class CalendarDayView: UIView {
    
    var delegate: CalendarDayViewDelegate?
    
    var dateLabel: UILabel?
    
    var innerBorder:UIView?
    var bottomBorder:UIView?
    
    var date: GDate?
    var isSelectedDay: Bool = false {
        didSet {
            if isSelectedDay {
                setSelectedDay()
            } else {
                unSetSelectedDay()
            }
        }
    }
    var isPresentDay: Bool = false {
        didSet {
            if isPresentDay {
                setPresentDay()
            } else {
                unSetPresentDay()
            }
        }
    }
    
    
    var selectedDayFillColor: UIColor = UIColor.greenColor()
    var presentDayFillColor: UIColor = UIColor.greenColor()
    
    var normalDayFontColor: UIColor = UIColor.whiteColor()
    var presentDayFontColor: UIColor = UIColor.greenColor()
    var selectedDayFontColor: UIColor = UIColor.greenColor()
    
    var normalDayFont: UIFont = UIFont(name: "DINPro", size: 14)!
    var presentDayFont: UIFont = UIFont(name: "DINPro", size: 14)!
    var selectedDayFont: UIFont = UIFont(name: "DINPro", size: 14)!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    init(frame: CGRect, date: GDate) {
        super.init(frame: frame)
        self.date = date
        let rect = CGRectMake(0, 0, frame.width - 4, frame.height)
        dateLabel = UILabel(frame: rect)
        dateLabel!.textColor = normalDayFontColor
        dateLabel!.textAlignment = .Center
        dateLabel!.text = "\(date.getDay().day)"
        dateLabel!.font = normalDayFont
        dateLabel!.layer.zPosition = 2
        addSubview(dateLabel!)

        
        innerBorder = UIView(frame: CGRectMake(0, 0, dateLabel!.frame.width, dateLabel!.frame.height))
        innerBorder!.layer.borderWidth = 1.0
        innerBorder!.layer.borderColor = UIColor(red: (97/255.0), green: (97/255.0), blue: (97/255.0), alpha: 1.0).CGColor
        innerBorder!.backgroundColor = UIColor(red: (97/255.0), green: (97/255.0), blue: (97/255.0), alpha: 0.1)
        innerBorder!.layer.zPosition = 1
        innerBorder!.hidden = true
        dateLabel!.addSubview(innerBorder!)
        
        
        bottomBorder = UIView(frame: CGRectMake(0, dateLabel!.frame.height - 2, dateLabel!.frame.width, 2))
        bottomBorder!.backgroundColor = UIColor(red: 118/255, green: 190/255, blue: 52/255, alpha: 1.0)
        bottomBorder!.layer.zPosition = 2
        bottomBorder!.hidden = true
        dateLabel!.addSubview(bottomBorder!)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CalendarDayView.selectDay(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selectDay(sender: UITapGestureRecognizer) {
        if isSelectedDay {
//            unSetSelectedDay()
//            isSelectedDay = false
//            delegate?.unSelectedDay(self)
        } else {
            setSelectedDay()
            isSelectedDay = true
//            delegate?.selectedDay(self)
//            print(date!.description)
            delegate?.tapOnDay()
            
        }
    }
    
    func setPresentDay() {
        if isSelectedDay {
            dateLabel!.textColor = selectedDayFontColor
            dateLabel!.font = selectedDayFont
        } else {
            dateLabel!.textColor = presentDayFontColor
            dateLabel!.font = presentDayFont
        }
    }
    
    func unSetPresentDay() {
        if isSelectedDay {
            dateLabel!.textColor = selectedDayFontColor
            dateLabel!.font = selectedDayFont
        } else {
            dateLabel!.textColor = normalDayFontColor
            dateLabel!.font = normalDayFont
        }
    }
    
    func setSelectedDay() {
 
        dateLabel!.textColor = selectedDayFontColor
        dateLabel!.font = selectedDayFont
        innerBorder!.hidden = false
        bottomBorder!.hidden = false
        delegate?.selectedDay(self)
    }
    
    func unSetSelectedDay() {
        if isPresentDay {
            dateLabel!.textColor = presentDayFontColor
            dateLabel!.font = presentDayFont
            innerBorder!.hidden = true
            bottomBorder!.hidden = true
        } else {
            dateLabel!.textColor = normalDayFontColor
            dateLabel!.font = normalDayFont
            innerBorder!.hidden = true
            bottomBorder!.hidden = true
        }        
    }
    
}
