//
//  SocialMediaViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/14/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit

class SocialMediaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var vision = Array<VisionItem>()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vision.append(VisionItem(titleText: " School Vision", contentText: "Vision statements outline a school’s objectives, and mission statements indicate how the school aims to achieve that vision. Schools might have one or both.\n" +
            "\n" +
            "Vision and mission statements in schools make a public declaration of the values of the school. But are such statements useful, or just nice to look at but of little substance? They can be useful – but it depends on what they include and how they’re used."))
        vision.append(VisionItem(titleText: " School Goals", contentText: "Vision statements outline a school’s objectives, and mission statements indicate how the school aims to achieve that vision. Schools might have one or both.\n" +
            "\n" +
            "Vision and mission statements in schools make a public declaration of the values of the school. But are such statements useful, or just nice to look at but of little substance? They can be useful – but it depends on what they include and how they’re used."))
        vision.append(VisionItem(titleText: " School Manger", contentText: "Vision statements outline a school’s objectives, and mission statements indicate how the school aims to achieve that vision. Schools might have one or both.\n" +
            "\n" +
            "Vision and mission statements in schools make a public declaration of the values of the school. But are such statements useful, or just nice to look at but of little substance? They can be useful – but it depends on what they include and how they’re used."))
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150.0
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return vision.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VisionTableViewCell") as! VisionTableViewCell
        
        cell.titleText.text = vision[indexPath.row].titleText!
        cell.contentText.text = vision[indexPath.row].contentText!
        
        cell.titleText.layer.cornerRadius = 10
        
        return cell
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
