//
//  GDate.swift
//

import Foundation

func ===(lhs: GDate, rhs: GDate) -> Bool {
    return lhs.timeInterval == rhs.timeInterval
}
func ==(lhs: GDate, rhs: GDate) -> Bool {
    let l = lhs.getDay()
    let r = rhs.getDay()
    return l.year == r.year && l.month == r.month && l.day == r.day
}
func !=(lhs: GDate, rhs: GDate) -> Bool {
    let l = lhs.getDay()
    let r = rhs.getDay()
    return l.year != r.year || l.month != r.month || l.day != r.day
}
func <=(lhs: GDate, rhs: GDate) -> Bool {
    return lhs.timeInterval <= rhs.timeInterval
}
func >=(lhs: GDate, rhs: GDate) -> Bool {
    return lhs.timeInterval >= rhs.timeInterval
}
func >(lhs: GDate, rhs: GDate) -> Bool {
    return lhs.timeInterval > rhs.timeInterval
}
func <(lhs: GDate, rhs: GDate) -> Bool {
    return lhs.timeInterval < rhs.timeInterval
}
func +(lhs: GDate, rhs: NSTimeInterval) -> GDate {
    return GDate(rhs, sinceDate:lhs)
}
func -(lhs: GDate, rhs: NSTimeInterval) -> GDate {
    return GDate(-rhs, sinceDate:lhs)
}
func +(lhs: NSTimeInterval, rhs: GDate) -> GDate {
    return GDate(lhs, sinceDate:rhs)
}
func -(lhs: NSTimeInterval, rhs: GDate) -> GDate {
    return GDate(-lhs, sinceDate:rhs)
}

func +=(inout lhs: GDate, rhs: NSTimeInterval) {
    return lhs = GDate(rhs, sinceDate:lhs)
}
func -=(inout lhs: GDate, rhs: NSTimeInterval) {
    return lhs = GDate(-rhs, sinceDate:lhs)
}


struct GDate {
    var timeInterval:NSTimeInterval = 0
    
    init() { self.timeInterval = NSDate().timeIntervalSince1970 }
}

// MARK: - EXPORT
extension GDate {
    func stringWithFormat(format:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(NSDate(timeIntervalSince1970: timeInterval))
    }
}

// MARK: - CALCULATION
extension GDate {
    mutating func addDay(day:Int) -> GDate {
        let second = timeInterval + Double(day) * 24 * 3600
        return GDate(second)
    }
    mutating func addHour(hour:Int) {
        timeInterval += Double(hour) * 3600
    }
    mutating func addMinute(minute:Int) {
        timeInterval += Double(minute) * 60
    }
    mutating func addSecond(second:Int) {
        timeInterval += Double(second)
    }
    mutating func addMonth(month m:Int) {
        let (year, month, day) = getDay()
        let (hour, minute, second) = getTime()
        let era = year / 100
        if let date = NSCalendar.currentCalendar().dateWithEra(era, year: year, month: month + m, day: day, hour: hour, minute: minute, second: second, nanosecond: 0) {
            timeInterval = date.timeIntervalSince1970
        } else {
            timeInterval += Double(m) * 30 * 24 * 3600
        }
    }
    mutating func addYear(year y:Int) {
        let (year, month, day) = getDay()
        let (hour, minute, second) = getTime()
        let era = year / 100
        if let date = NSCalendar.currentCalendar().dateWithEra(era, year: year + y, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: 0) {
            timeInterval = date.timeIntervalSince1970
        } else {
            timeInterval += Double(y) * 365 * 24 * 3600
        }
    }
}

// MARK: - ?
extension GDate {
    func between(begin:GDate,_ over:GDate) -> Bool {
        return (self >= begin && self <= over) || (self >= over && self <= begin)
    }
}

// MARK: - GET DATE AND TIME
extension GDate {
    
    // for example : let (year, month, day) = date.getDay()
    func getDay() -> (year:Int, month:Int, day:Int) {
        var year:Int = 0, month:Int = 0, day:Int = 0
        let date = NSDate(timeIntervalSince1970: timeInterval)
        NSCalendar.currentCalendar().getEra(nil, year: &year, month: &month, day: &day, fromDate: date)
        return (year, month, day)
    }
    
    // for example : let (hour, minute, second) = date.getTime()
    func getTime() -> (hour:Int, minute:Int, second:Int) {
        var hour:Int = 0, minute:Int = 0, second:Int = 0
        let date = NSDate(timeIntervalSince1970: timeInterval)
        NSCalendar.currentCalendar().getHour(&hour, minute: &minute, second: &second, nanosecond: nil, fromDate: date)
        return (hour, minute, second)
    }
    
    func getWeek() -> (year: Int, dayOfWeek: Int, weekOfYear: Int) {
        var dayOfWeek:Int = 0, weekOfYear:Int = 0, year: Int = 0
        let date = NSDate(timeIntervalSince1970: timeInterval)
        NSCalendar.currentCalendar().getEra(nil,yearForWeekOfYear: &year, weekOfYear: &weekOfYear, weekday: &dayOfWeek, fromDate: date)
        return (year, dayOfWeek, weekOfYear)
    }
}

// MARK: - CONSTRUCTOR
extension GDate {
    init(year:Int, month:Int = 1, day:Int = 1, hour:Int = 0, minute:Int = 0, second:Int = 0) {
        let era = year / 100
        if let date = NSCalendar.currentCalendar().dateWithEra(era, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: 0) {
            timeInterval = date.timeIntervalSince1970
        }
    }
}

extension GDate {
    init(_ v: NSTimeInterval) { timeInterval = v }
    
    init(_ v: NSTimeInterval, sinceDate:GDate) {
        let date = NSDate(timeIntervalSince1970: sinceDate.timeInterval)
        timeInterval = NSDate(timeInterval: v, sinceDate: date).timeIntervalSince1970
    }
    
    init(sinceNow: NSTimeInterval) {
        timeInterval = NSDate(timeIntervalSinceNow: sinceNow).timeIntervalSince1970
    }
    
    init(sinceReferenceDate: NSTimeInterval) {
        timeInterval = NSDate(timeIntervalSinceReferenceDate: sinceReferenceDate).timeIntervalSince1970
    }
}

extension GDate {
    init(_ v: String, style: NSDateFormatterStyle = .NoStyle) {
        let formatter = NSDateFormatter()
        formatter.dateStyle = style
        if let date = formatter.dateFromString(v) {
            self.timeInterval = date.timeIntervalSince1970
        }
    }
    
    init(_ v: String, dateFormat:String = "yyyy-MM-dd HH:mm:ss") {
        let formatter = NSDateFormatter()
        formatter.dateFormat = dateFormat
        if let date = formatter.dateFromString(v) {
            self.timeInterval = date.timeIntervalSince1970
        }
    }
}

extension GDate {
    init(_ v: UInt8) { timeInterval = Double(v) }
    init(_ v: Int8) { timeInterval = Double(v) }
    init(_ v: UInt16) { timeInterval = Double(v) }
    init(_ v: Int16) { timeInterval = Double(v) }
    init(_ v: UInt32) { timeInterval = Double(v) }
    init(_ v: Int32) { timeInterval = Double(v) }
    init(_ v: UInt64) { timeInterval = Double(v) }
    init(_ v: Int64) { timeInterval = Double(v) }
    init(_ v: UInt) { timeInterval = Double(v) }
    init(_ v: Int) { timeInterval = Double(v) }
}

extension GDate {
    init(_ v: Float) { timeInterval = Double(v) }
    //init(_ v: Float80) { timeInterval = Double(v) }
}

// MARK: - OUTPUT
extension GDate : CustomStringConvertible {
    var description: String {
        return NSDate(timeIntervalSince1970: timeInterval).description
    }
}
extension GDate : CustomDebugStringConvertible {
    var debugDescription: String {
        return NSDate(timeIntervalSince1970: timeInterval).debugDescription
    }
}
//
//// MARK: -
//extension Date : IntegerLiteralConvertible {
//    static func convertFromIntegerLiteral(value: Int64) -> Date {
//        return Date(Double(value))
//    }
//}
//
//// MARK: -
//extension Date : FloatLiteralConvertible {
//    static func convertFromFloatLiteral(value: Double) -> Date {
//        return Date(value)
//    }
//}

// MARK: - MIRROR
//extension GDate : Reflectable {
//    func getMirror() -> MirrorType {
//        return reflect(self)
//    }
//}

// MARK: - Hashable
extension GDate : Hashable {
    var hashValue: Int { return timeInterval.hashValue }
}

//  == or !=
extension GDate : Equatable {
    
}

// MARK:  > < >= <= 
extension GDate : Comparable {
    
}
