//
//  InfoDetailsViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/14/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit

class InfoDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var infos = Array<InfoItem>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        infos.append(InfoItem(titleText: "The Origns of the practical of punshment towards the son"))
        
        infos.append(InfoItem(titleText: "The Origns of the practical of punshment towards the son"))
        
        infos.append(InfoItem(titleText: "The Origns of the practical of punshment towards the son"))
        
        infos.append(InfoItem(titleText: "The Origns of the practical of punshment towards the son"))
        
        tableView.rowHeight = 120.0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell") as! MoreTableViewCell
        
        cell.moreTitle.text = infos[indexPath.row].titleText!
        
        return cell
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        UIApplication.shared.statusBarStyle = .lightContent
        //UIApplication.shared.statusBarView?.backgroundColor = UIColor.red
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = #colorLiteral(red: 0.1450980392, green: 0.5490196078, blue: 0.9960784314, alpha: 1)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }
    
}
