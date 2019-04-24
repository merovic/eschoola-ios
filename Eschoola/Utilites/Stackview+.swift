//
//  Stackview+.swift
//  Eschoola
//
//  Created by Apple on 4/20/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

extension UIStackView{
    
    func addBackground(color: UIColor){
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
    
}
