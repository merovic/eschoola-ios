//
//  ViewController.swift
//  Eschoola
//
//  Created by Apple on 4/8/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import MOLH

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(MOLHLanguage.isRTLLanguage())
        {
            tabBar.items?[0].title = "المدارس"
            tabBar.items?[1].title = "الأخبار"
        }
        
    }


}

