//
//  FavoriteViewController.swift
//  Eschoola
//
//  Created by Apple on 4/20/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var schools = Array<schoolListItem>()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Favorite List"
        
        tableView.rowHeight = 90.0
        
        schools.append(schoolListItem(schoolName: "El-Salam Modern School"))
        schools.append(schoolListItem(schoolName: "El-Salam Modern School"))
        schools.append(schoolListItem(schoolName: "El-Salam Modern School"))
        schools.append(schoolListItem(schoolName: "El-Salam Modern School"))
        schools.append(schoolListItem(schoolName: "El-Salam Modern School"))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolsListTableViewCell") as! SchoolsListTableViewCell
        
        cell.schoolName.text = schools[indexPath.row].schoolName!
        
        cell.schoolName.font = UIFont.init(name: "DroidArabicKufi" , size: 12)
        
        cell.container.layer.cornerRadius = 10
        cell.container.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
        cell.container.layer.borderWidth = 0.5
        cell.container.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        cell.schoolLogoContainer.layer.cornerRadius = 5
        cell.schoolLogoContainer.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.schoolLogoContainer.layer.borderWidth = 1
        cell.schoolLogoContainer.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
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
