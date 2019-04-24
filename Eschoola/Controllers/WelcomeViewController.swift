//
//  WelcomeViewController.swift
//  Eschoola
//
//  Created by Apple on 4/23/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import MOLH

class WelcomeViewController: UIViewController {

    @IBOutlet weak var facebook: UIButton!
    @IBOutlet weak var twitter: UIButton!
    @IBOutlet weak var email: UIButton!
    @IBOutlet weak var donthave: UILabel!
    @IBOutlet weak var registernow: UIButton!
    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var welcome: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(MOLHLanguage.isRTLLanguage())
        {
            donthave.text = "لا تملك حساب ؟"
            donthave.font = UIFont.init(name: "DroidArabicKufi", size: 15)
            welcome.text = "اهلا بك فى اسكولا"
            welcome.font = UIFont.init(name: "DroidArabicKufi", size: 16)
            
            facebook.titleLabel?.font = UIFont(name: "DroidArabicKufi", size: 18)
            twitter.titleLabel?.font = UIFont(name: "DroidArabicKufi", size: 18)
            email.titleLabel?.font = UIFont(name: "DroidArabicKufi", size: 18)
            registernow.titleLabel?.font = UIFont(name: "DroidArabicKufi", size: 15)
            skip.titleLabel?.font = UIFont(name: "DroidArabicKufi", size: 15)
            
            facebook.setTitle("تسجيل الدخول عن طريق فيس بوك", for: .normal)
            twitter.setTitle("تسجيل الدخول عن طريق تويتر", for: .normal)
            email.setTitle("تسجيل الدخول عن طريق الأيميل", for: .normal)
            registernow.setTitle("سجل الان", for: .normal)
            skip.setTitle("تخطى تلك الخطوة", for: .normal)
            
            facebook.imageEdgeInsets = UIEdgeInsets(top: 0, left:10, bottom: 0, right: 0)
            twitter.imageEdgeInsets = UIEdgeInsets(top: 0, left:10, bottom: 0, right: 0)
            email.imageEdgeInsets = UIEdgeInsets(top: 0, left:10, bottom: 0, right: 0)
        }
    }
    
    
    @IBAction func skipButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registrationButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController 
        
        self.present(vc, animated: true, completion: nil)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func emailButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        self.present(vc, animated: true, completion: nil)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
