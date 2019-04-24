//
//  NewsViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/14/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var news = Array<InfoItem>()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        news.append(InfoItem(titleText: "The Origns of the practical of punshment towards the son"))
        
        news.append(InfoItem(titleText: "The Origns of the practical of punshment towards the son"))
        
        news.append(InfoItem(titleText: "The Origns of the practical of punshment towards the son"))
        
        news.append(InfoItem(titleText: "The Origns of the practical of punshment towards the son"))
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        
        cell.newsTitle.text = news[indexPath.row].titleText!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Guest", bundle: nil)
        // you need to cast this next line to the type of VC.
        let vc = storyboard.instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
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
