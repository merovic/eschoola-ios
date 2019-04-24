//
//  ReservationViewController.swift
//  Eschoola
//
//  Created by Apple on 4/20/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var reservations = Array<ReservationItem>()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Reservations"
        
        reservations.append(ReservationItem(resquest: "REQUEST NO. 4875"))
        reservations.append(ReservationItem(resquest: "REQUEST NO. 8475"))
        reservations.append(ReservationItem(resquest: "REQUEST NO. 2865"))
        reservations.append(ReservationItem(resquest: "REQUEST NO. 0475"))
        
        tableView.rowHeight = 252.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationTableViewCell") as! ReservationTableViewCell
        
        cell.requestStatus.layer.masksToBounds = true
        cell.requestStatus.layer.cornerRadius = 10.0
        
        cell.itemContainer.layer.cornerRadius = 10
        cell.itemContainer.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1)
        cell.itemContainer.layer.borderWidth = 0.5
        cell.itemContainer.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        cell.imageContainer.layer.cornerRadius = 5
        cell.imageContainer.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.imageContainer.layer.borderWidth = 1
        cell.imageContainer.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        cell.amountsStack.addBackground(color: #colorLiteral(red: 0.1882352941, green: 0.3843137255, blue: 0.5294117647, alpha: 1))
        
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
