//
//  FilterViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/13/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit
import MOLH

class FilterViewController: UIViewController {

    @IBOutlet weak var kmSlider: UISlider!
    @IBOutlet weak var kmValue: UILabel!
    @IBOutlet weak var sar: UILabel!
    
    @IBOutlet weak var boysText: UILabel!
    @IBOutlet weak var girlsText: UILabel!
    @IBOutlet weak var multiple: UILabel!
    
    @IBOutlet weak var boysView: UIView!
    @IBOutlet weak var girlsView: UIView!
    @IBOutlet weak var multipleView: UIView!
    
    @IBOutlet weak var systemTextfield: UITextField!
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var districtTextField: UITextField!
    
    
    @IBOutlet weak var applyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        boysView.layer.borderWidth = 1
        
        boysView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        girlsView.layer.borderWidth = 1
        
        girlsView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        multipleView.layer.borderWidth = 1
        
        multipleView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        applyButton.layer.cornerRadius = 15
        applyButton.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
        applyButton.layer.borderWidth = 1
        applyButton.layer.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
        
        kmSlider.addTarget(self, action: #selector(FilterViewController.sliderValueDidChange(_:)), for: .valueChanged)
        
        if(MOLHLanguage.isRTLLanguage())
        {
            sar.text = "ر.س"
            
            boysText.text = "اولاد"
            girlsText.text = "بنات"
            multiple.text = "مشتركة"
            
            let attributes = [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font : UIFont(name: "DroidArabicKufi", size: 14)! // Note the !
            ]
            
            systemTextfield.attributedPlaceholder = NSAttributedString(string: "اختر النظام", attributes:attributes)
            systemTextfield.textAlignment = .right
            
            courseTextField.attributedPlaceholder = NSAttributedString(string: "اختر المنهج", attributes:attributes)
            courseTextField.textAlignment = .right
            
            cityTextField.attributedPlaceholder = NSAttributedString(string: "اختر المدينة", attributes:attributes)
            cityTextField.textAlignment = .right
            
            districtTextField.attributedPlaceholder = NSAttributedString(string: "اختر الحى", attributes:attributes)
            districtTextField.textAlignment = .right
            
            applyButton.titleLabel?.font = UIFont(name: "DroidArabicKufi", size: 15)
            
            applyButton.setTitle("تفعيل", for: .normal)
        }
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        if(MOLHLanguage.isRTLLanguage())
        {
            kmValue.text = "كم " + (NSString(format: "%.2f", kmSlider.value) as String)
        }else
        {
            
            kmValue.text = (NSString(format: "%.2f", kmSlider.value) as String) + " KM"
        }
    }

    
    @IBAction func applyClick(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
