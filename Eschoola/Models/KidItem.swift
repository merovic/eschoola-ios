//
//  KidItem.swift
//  Eschoola
//
//  Created by Apple on 4/19/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

struct KidItem:Decodable{
    
    var kidName:String?
    var kidPic:String?
    var kidLevel:String?
    
    init(kidName:String,kidPic:String,kidLevel:String) {
        
        self.kidName = kidName
        self.kidPic = kidPic
        self.kidLevel = kidLevel
        
    }
}
