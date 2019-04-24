//
//  CalendarItem.swift
//  NanoSchool
//
//  Created by Walidghonem on 6/7/18.
//  Copyright © 2018 Walidghonem. All rights reserved.
//

struct CalendarItem:Decodable{
    
    var eventDate:String?
    var eventName:String?
    
    init(eventDate:String,eventName:String) {
        
        self.eventDate = eventDate
        self.eventName = eventName
    }
}

