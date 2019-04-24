//
//  SchoolFeaturesItem.swift
//  Eschoola
//
//  Created by Apple on 4/17/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

struct SchoolFeaturesItem:Decodable{
    
    var titleText:String?
    var backgroundURL:String?
    var iconURL:String?
    
    init(titleText:String,backgroundURL:String,iconURL:String) {
        
        self.titleText = titleText
        self.backgroundURL = backgroundURL
        self.iconURL = iconURL
    }
}
