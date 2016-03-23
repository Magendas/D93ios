//
//  DdayTimer.swift
//  D93Conf
//
//  Created by Steve Song on 3/23/16.
//  Copyright © 2016 magendas. All rights reserved.
//

import Foundation

class DdayTimer  {
    var timer = NSTimer()
    
    
    func getTimer() -> NSTimer {
        
        
        return self.timer
        
    }
    
    func getDday()-> Int {
        let dday = "2016-05-28"
        let today = "2016-03-22"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let startDate:NSDate = dateFormatter.dateFromString(today)!
        let endDate:NSDate = dateFormatter.dateFromString(dday)!
        
        let calendar = NSCalendar.currentCalendar()
        
        
        let flags = NSCalendarUnit.Day
        let components = calendar.components(flags, fromDate: startDate, toDate: endDate, options: [])
        
        print(components)
        return components.day
    }
    

}