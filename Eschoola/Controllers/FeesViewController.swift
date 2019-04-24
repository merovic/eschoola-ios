//
//  FeesViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/13/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit
import WormTabStrip
import CarbonKit

class FeesViewController: UIViewController,WormTabStripDelegate {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var header: CardView!
    @IBOutlet weak var mainCard: CardView!
    
    var tabs:[UIViewController] = []
    
    var con:UIView!
    
    let stages = ["Secondary Stage", "Preparatory Stage", "Primary Stage", "Kids Stage"] //28
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        con = UIView()
        con.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(con)
        
        NSLayoutConstraint.activate([
            con.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8),
            con.bottomAnchor.constraint(equalTo: mainCard.bottomAnchor, constant: -8),
            con.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 8),
            con.trailingAnchor.constraint(equalTo: mainCard.trailingAnchor, constant: -8)
            ])
        
        setUpTabs()
        setUpViewPager()
       
    }
    
    
    func setUpTabs(){
        for i in 0...stages.count-1 {
            let vc = SubFeesViewController(titleScreen: stages[i])
            tabs.append(vc)
        }
    }
    
    func setUpViewPager(){
        
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        
        let frame =  CGRect(x: 0, y: 0, width: screenWidth - 45, height: screenHeight - 250)
        let viewPager:WormTabStrip = WormTabStrip(frame: frame)
        self.con.addSubview(viewPager)
        viewPager.delegate = self
        viewPager.eyStyle.wormStyel = .LINE
        viewPager.eyStyle.isWormEnable = true
        viewPager.eyStyle.spacingBetweenTabs = 0
        viewPager.eyStyle.kHeightOfTopScrollView = 35.0
        viewPager.eyStyle.WormColor = #colorLiteral(red: 0.05098039216, green: 0.2823529412, blue: 0.4549019608, alpha: 1)
        viewPager.eyStyle.dividerBackgroundColor = .white
        viewPager.eyStyle.tabItemSelectedColor = #colorLiteral(red: 0.05098039216, green: 0.2823529412, blue: 0.4549019608, alpha: 1)
        viewPager.eyStyle.topScrollViewBackgroundColor = .white
        viewPager.eyStyle.tabItemDefaultColor = .black
        viewPager.currentTabIndex = 0
        viewPager.buildUI()
    }
    
    
    func WTSNumberOfTabs() -> Int {
        return stages.count
    }
    
    func WTSTitleForTab(index: Int) -> String {
        
        return stages[index]
    }
    
    func WTSViewOfTab(index: Int) -> UIView {
        let view = tabs[index]
        return view.view
    }
    
    func WTSReachedLeftEdge(panParam: UIPanGestureRecognizer) {
        
    }
    
    func WTSReachedRightEdge(panParam: UIPanGestureRecognizer) {
        
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
