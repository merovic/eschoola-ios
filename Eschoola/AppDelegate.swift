//
//  AppDelegate.swift
//  Eschoola
//
//  Created by Apple on 4/8/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import MOLH
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MOLHResetable {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "en" : "en")
        MOLHLanguage.setDefaultLanguage("en")
        MOLH.shared.activate(true)
        MOLH.shared.specialKeyWords = ["Cancel","Done"]
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        // Set the Font of App to Droid Arabic Kufi
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "DroidArabicKufi", size: 9)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any] , for: .normal)
        
        IQKeyboardManager.shared.enable = true
        
        return true
    }
    
    func reset() {
        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        let stry = UIStoryboard(name: "Main", bundle: nil)
        rootviewcontroller.rootViewController = stry.instantiateViewController(withIdentifier: "ViewController")
    }
    
}

