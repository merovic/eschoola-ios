//
//  DicountViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/14/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit
import BEMCheckBox

class DicountViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,BEMCheckBoxDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
     var kids = Array<KidItem>()
    
    @IBOutlet weak var kidPreview: UITextField!
    
    @IBOutlet weak var addKidLayout: UIView!
    
    @IBOutlet weak var NewKidLayout: UIView!
    
    @IBOutlet weak var uploadPic: UIImageView!
    
    @IBOutlet weak var studentNameTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var lastSchoolCheckBox: BEMCheckBox!
    @IBOutlet weak var busOneWayCheckBox: BEMCheckBox!
    @IBOutlet weak var busTwoWayCheckBox: BEMCheckBox!
    @IBOutlet weak var cashCheckBox: BEMCheckBox!
    @IBOutlet weak var creditCheckBox: BEMCheckBox!
    
    @IBOutlet weak var lastSchoolTextField: UITextField!
    
    var genderPickerview = UIPickerView()
    
    var genders = ["Select Gender","Male","Female"]
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kids.append(KidItem(kidName: "Mohamed", kidPic: "jg", kidLevel: "KG2"))
        kids.append(KidItem(kidName: "Ahmed", kidPic: "jg", kidLevel: "KG1"))
        kids.append(KidItem(kidName: "Sara", kidPic: "jg", kidLevel: "KG3"))

        tableView.rowHeight = 72.0
        
        lastSchoolCheckBox.delegate = self
        busOneWayCheckBox.delegate = self
        busTwoWayCheckBox.delegate = self
        cashCheckBox.delegate = self
        creditCheckBox.delegate = self
        
        lastSchoolTextField.isEnabled = false
        
        genderTextField.inputView = genderPickerview
        
        genderPickerview.dataSource = self
        genderPickerview.delegate = self
        
        showDatePicker()
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
        }else if(checkBox==busOneWayCheckBox)
        {
            busTwoWayCheckBox.setOn(false, animated: true)
            
        }else if(checkBox==busTwoWayCheckBox)
        {
            busOneWayCheckBox.setOn(false, animated: true)
            
        }else if(checkBox==cashCheckBox)
        {
            creditCheckBox.setOn(false, animated: true)
            
        }else if(checkBox==creditCheckBox)
        {
            cashCheckBox.setOn(false, animated: true)
        }
        
    }
    
    func alertbox()
    {
        let refreshAlert = UIAlertController(title: "Add a Kid", message: "Do you already add your son on eSchoola ?", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            
            self.addKidLayout.isHidden = false
            self.NewKidLayout.isHidden = true
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            
            self.addKidLayout.isHidden = true
            self.NewKidLayout.isHidden = false
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return kids.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "KidsTableViewCell") as! KidsTableViewCell
        
        cell.kidPic.layer.cornerRadius = cell.kidPic.frame.size.height / 2;
        cell.kidPic.layer.masksToBounds = true;
        cell.kidPic.layer.borderWidth = 0;
        
        cell.kidNameText.text = kids[indexPath.row].kidName!
        cell.kidLevelText.text = kids[indexPath.row].kidLevel!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        kidPreview.text = kids[indexPath.row].kidName
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return genders.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return genders[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        genderTextField.text = genders[row]
        genderTextField.resignFirstResponder()
        
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    @IBAction func backpressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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
        
        alertbox()
    }

}
