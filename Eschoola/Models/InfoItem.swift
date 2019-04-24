//
//  InfoItem.swift
//  NanoSchool
//
//  Created by Apple on 3/14/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

struct InfoItem:Decodable{
    
    var titleText:String?
    
    init(titleText:String) {
        
        self.titleText = titleText
    }
}
