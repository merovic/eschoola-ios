//
//  schoolListItem.swift
//  NanoSchool
//
//  Created by Apple on 3/12/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

struct schoolListItem:Decodable{
    
    var schoolName:String?
    
    init(schoolName:String) {
        
        self.schoolName = schoolName
    }
}
