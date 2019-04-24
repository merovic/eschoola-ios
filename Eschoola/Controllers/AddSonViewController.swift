//
//  AddSonViewController.swift
//  Eschoola
//
//  Created by Apple on 4/23/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import BEMCheckBox

class AddSonViewController: UIViewController,BEMCheckBoxDelegate {

    
    @IBOutlet weak var lastSchoolCheckBox: BEMCheckBox!
    @IBOutlet weak var lastSchoolTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lastSchoolCheckBox.delegate = self
    }
    
    func didTap(_ checkBox: BEMCheckBox) {
        
        if(checkBox==lastSchoolCheckBox)
        {
            if(checkBox.on)
            {
                lastSchoolTextField.isEnabled = true
            }else
            {
                lastSchoolTextField.isEnabled = false
            }
            
        }
        
    }
    

    @IBAction func addButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
