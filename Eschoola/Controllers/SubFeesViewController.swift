//
//  SubFeesViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/13/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit
import MOLH

class SubFeesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var titleScreen: String?
    
    var table:UITableView!
    
    var fees = Array<FeesDetailsItem>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fees.append(FeesDetailsItem(levelName: "KG 1"))
        fees.append(FeesDetailsItem(levelName: "KG 2"))
        fees.append(FeesDetailsItem(levelName: "KG 3"))
        
        self.view.backgroundColor = .white
        
        let test = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 40))
        if UIDevice.current.userInterfaceIdiom == .pad {
            test.center = CGPoint(x: 385, y: 40)
        }else if(UIDevice.current.userInterfaceIdiom == .phone)
        {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5/5S/5C/SE")
            case 1334:
                print("iPhone 6/6S/7/8")
                test.center = CGPoint(x: 160, y: 40)
            case 2208:
                print("iPhone 6+/6S+/7+/8+")
            case 2436:
                print("iPhone X/XS")
                
                test.center = CGPoint(x: 160, y: 40)
                
            case 1792:
                print("iPhone XR")
                
                test.center = CGPoint(x: 190, y: 40)
                
            case 2688:
                print("iPhone XS Max")
                
                test.center = CGPoint(x: 160, y: 40)
                
            default:
                print("unknown")
                print(UIScreen.main.nativeBounds.height)
            }
        }
        
        test.textAlignment = .center
        test.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.2823529412, blue: 0.4549019608, alpha: 1)
        test.textColor = .white
        test.text = titleScreen
        self.view.addSubview(test)
        
        
        table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.separatorStyle = .none
        
        //table.rowHeight = 450.0
        table.rowHeight = 390.0
        
        if(MOLHLanguage.isRTLLanguage())
        {
            let nibNameLeft = UINib(nibName: "FeesDetailsTableViewCellArabic", bundle: nil)
            table.register(nibNameLeft, forCellReuseIdentifier: "FeesDetailsTableViewCell")
        }else
        {
            let nibNameLeft = UINib(nibName: "FeesDetailsTableViewCell", bundle: nil)
            table.register(nibNameLeft, forCellReuseIdentifier: "FeesDetailsTableViewCell")
        }
        
    
        table.dataSource = self
        table.delegate = self
        self.view.addSubview(table)
        
        //auto layout make table view fill super view
        let widthConstraint  = NSLayoutConstraint(item: table, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 8)
        let heightConstraint = NSLayoutConstraint(item: table, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 8)
        let topConstrain = NSLayoutConstraint(item: table, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: test, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 8)
        view.addConstraints([widthConstraint, heightConstraint,topConstrain])
        
    }
    
    init(titleScreen: String?) {
        self.titleScreen = titleScreen
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeesDetailsTableViewCell", for: indexPath) as? FeesDetailsTableViewCell
        
        cell!.levelName.text = fees[indexPath.row].levelName
        
        cell!.applyButton.addTarget(self, action: #selector(SubFeesViewController.approveSeque), for: .touchUpInside)
        
        return cell!
    }
    
    
    @objc func approveSeque(sender : UIButton){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DicountViewController") as! DicountViewController
        
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    override func updateViewConstraints() {
        
        super.updateViewConstraints()
    }

}
