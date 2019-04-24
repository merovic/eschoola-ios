//
//  NewFeesViewController.swift
//  Eschoola
//
//  Created by Apple on 4/18/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import CarbonKit

class NewFeesViewController: UIViewController, CarbonTabSwipeNavigationDelegate {
    
    @IBOutlet weak var container: UIView!
    
    let stages = ["Secondary Stage", "Preparatory Stage", "Primary Stage", "Kids Stage"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Fees"
        
        let tabSwipe = CarbonTabSwipeNavigation(items: stages, delegate: self)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            tabSwipe.setTabExtraWidth(160)
        }else if(UIDevice.current.userInterfaceIdiom == .phone)
        {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5/5S/5C/SE")
            case 1334:
                print("iPhone 6/6S/7/8")
            case 2208:
                print("iPhone 6+/6S+/7+/8+")
            case 2436:
                print("iPhone X/XS")
                
                tabSwipe.setTabExtraWidth(60)
                
            case 1792:
                print("iPhone XR")
                
                tabSwipe.setTabExtraWidth(60)
                
            case 2688:
                print("iPhone XS Max")
                
                tabSwipe.setTabExtraWidth(60)
                
            default:
                print("unknown")
                print(UIScreen.main.nativeBounds.height)
            }
        }
        
        tabSwipe.setSelectedColor(#colorLiteral(red: 0.9803921569, green: 0.6588235294, blue: 0.09803921569, alpha: 1))
        tabSwipe.setNormalColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        tabSwipe.setIndicatorColor(#colorLiteral(red: 0.9803921569, green: 0.6588235294, blue: 0.09803921569, alpha: 1))
        tabSwipe.insert(intoRootViewController: self, andTargetView: container)
    }
    

    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        let vc = SubFeesViewController(titleScreen: stages[Int(index)])
        
        return vc
    }
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }

}
