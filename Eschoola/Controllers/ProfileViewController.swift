//
//  ProfileViewController.swift
//  Eschoola
//
//  Created by Apple on 4/20/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var kids = Array<KidItem>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Profile"
        
        profilePic.layer.cornerRadius = profilePic.frame.size.height / 2;

        kids.append(KidItem(kidName: "Mohamed", kidPic: "jg", kidLevel: "KG2"))
        kids.append(KidItem(kidName: "Ahmed", kidPic: "jg", kidLevel: "KG1"))
        kids.append(KidItem(kidName: "Sara", kidPic: "jg", kidLevel: "KG3"))
        
        tableView.rowHeight = 72.0
        tableView.tableFooterView = UIView()
    }

    
    @IBAction func addSon(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "SideMenu", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AddSonViewController") as! AddSonViewController
        
        self.present(newViewController, animated: true, completion: nil)
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
