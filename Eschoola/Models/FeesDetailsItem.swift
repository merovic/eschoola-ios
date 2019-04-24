//
//  FeesDetailsItem.swift
//  NanoSchool
//
//  Created by Apple on 3/13/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

struct FeesDetailsItem:Decodable{
    
    var levelName:String?
    
    init(levelName:String) {
        
        self.levelName = levelName
    }
}
