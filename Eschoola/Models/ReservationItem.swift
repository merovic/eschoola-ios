//
//  ReservationItem.swift
//  Eschoola
//
//  Created by Apple on 4/20/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

struct ReservationItem:Decodable{
    
    var resquest:String?
    
    init(resquest:String) {
        
        self.resquest = resquest
        
    }
}

