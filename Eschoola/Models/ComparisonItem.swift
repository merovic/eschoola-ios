//
//  ComparisonItem.swift
//  NanoSchool
//
//  Created by Apple on 3/14/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

struct ComparisonItem:Decodable{
    
    var icon:String?
    var pointComparison:String?
    var point1:String?
    var point2:String?
    
    init(icon:String,pointComparison:String,point1:String,point2:String) {
        
        self.icon = icon
        self.pointComparison = pointComparison
        self.point1 = point1
        self.point2 = point2
    }
}
