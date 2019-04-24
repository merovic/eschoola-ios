//
//  VisionItem.swift
//  Eschoola
//
//  Created by Apple on 4/16/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

struct VisionItem:Decodable{
    
    var titleText:String?
    var contentText:String?
    
    init(titleText:String,contentText:String) {
        
        self.titleText = titleText
        self.contentText = contentText
    }
}
