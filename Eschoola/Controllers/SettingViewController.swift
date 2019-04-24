//
//  SettingViewController.swift
//  Eschoola
//
//  Created by Apple on 4/23/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import MOLH

class SettingViewController: UIViewController {

    @IBOutlet weak var languageText: UILabel!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var arabicButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arabicButton.backgroundColor = #colorLiteral(red: 0.186537981, green: 0.3856770396, blue: 0.5312414765, alpha: 1)
        arabicButton.setTitleColor(#colorLiteral(red: 0.9999268651, green: 1, blue: 0.9998735785, alpha: 1), for: .normal)
        arabicButton.layer.borderColor = #colorLiteral(red: 0.186537981, green: 0.3856770396, blue: 0.5312414765, alpha: 1)
        arabicButton.layer.borderWidth = 1
        
        englishButton.backgroundColor = #colorLiteral(red: 0.9999268651, green: 1, blue: 0.9998735785, alpha: 1)
        englishButton.setTitleColor(#colorLiteral(red: 0.186537981, green: 0.3856770396, blue: 0.5312414765, alpha: 1), for: .normal)
        englishButton.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        englishButton.layer.borderWidth = 1

        
        
        if(MOLHLanguage.isRTLLanguage())
        {
        
            self.navigationItem.title = "اللغة"
            
        }else
        {
            
            self.navigationItem.title = "Language"
            
        }
        
        
        arabicButton.titleLabel?.font = UIFont(name: "DroidArabicKufi", size: 15)
        
        englishButton.titleLabel?.font = UIFont(name: "DroidArabicKufi", size: 15)
    }
    
    
    @IBAction func englishButton(_ sender: Any) {
        
        if(MOLHLanguage.isRTLLanguage())
        {
            MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
            MOLH.reset()
        }else
        {
            print("language is already english")
        }
    }
    
    
    @IBAction func arabicButton(_ sender: Any) {
        
        if(MOLHLanguage.isRTLLanguage())
        {
            print("language is already arabic")
        }else
        {
            MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
            MOLH.reset()
        }
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
