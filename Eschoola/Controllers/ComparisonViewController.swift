//
//  ComparisonViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/14/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit

class ComparisonViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var comparison = Array<ComparisonItem>()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comparison.append(ComparisonItem(icon: "distancecomp", pointComparison: "Distance", point1: "7 KM", point2: "5 KM"))
        
         comparison.append(ComparisonItem(icon: "capcomp", pointComparison: "Levels", point1: "All Levels", point2: "Expermintal"))
        
        comparison.append(ComparisonItem(icon: "boysgirlscomp", pointComparison: "Genders", point1: "Boys", point2: "Multi"))
        
        comparison.append(ComparisonItem(icon: "districtcomp", pointComparison: "District", point1: "Hateen", point2: "Kortoba"))
        
        comparison.append(ComparisonItem(icon: "timecomp", pointComparison: "Time", point1: "Morning", point2: "Evening"))
        
        comparison.append(ComparisonItem(icon: "books", pointComparison: "Course", point1: "American", point2: "British"))
        
        comparison.append(ComparisonItem(icon: "certifiedcom", pointComparison: "Certification", point1: "-", point2: "ADVone"))
        
        comparison.append(ComparisonItem(icon: "studentscomp", pointComparison: "Students Average", point1: "13", point2: "15"))
        
        comparison.append(ComparisonItem(icon: "pitchescomp", pointComparison: "Pitches", point1: "1", point2: "1"))
        
        comparison.append(ComparisonItem(icon: "poolcomp", pointComparison: "Pools", point1: "2", point2: "1"))
        
        comparison.append(ComparisonItem(icon: "books", pointComparison: "Libraries", point1: "2", point2: "1"))
        
        comparison.append(ComparisonItem(icon: "onlineappcom", pointComparison: "Online Registration", point1: "Not Avaliable", point2: "Avaliable"))
        
        comparison.append(ComparisonItem(icon: "discountcom", pointComparison: "Early Apply Discount", point1: "Not Avaliable", point2: "5%"))
        
        comparison.append(ComparisonItem(icon: "groupscom", pointComparison: "Groups Discount", point1: "10%", point2: "7%"))
        
        comparison.append(ComparisonItem(icon: "moneycomp", pointComparison: "Early Stage 1 Fees", point1: "2000", point2: "2200"))
        
        comparison.append(ComparisonItem(icon: "moneycomp", pointComparison: "Early Stage 2 Fees", point1: "3000", point2: "3200"))
        
        comparison.append(ComparisonItem(icon: "moneycomp", pointComparison: "Early Stage 3 Fees", point1: "4000", point2: "4200"))
        
        comparison.append(ComparisonItem(icon: "moneycomp", pointComparison: "Primary Stage Fees", point1: "5000", point2: "5200"))
        
        comparison.append(ComparisonItem(icon: "moneycomp", pointComparison: "Preparatory Stage Fees", point1: "6000", point2: "6200"))
        
        
        tableview.rowHeight = 90.0
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return comparison.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComparisonTableViewCell") as! ComparisonTableViewCell
        
        cell.compImage.image = UIImage(named: comparison[indexPath.row].icon!)
        cell.pointOfComparison.text = comparison[indexPath.row].pointComparison!
        cell.point1Text.text = comparison[indexPath.row].point1!
        cell.point2Text.text = comparison[indexPath.row].point2!
        
        cell.containerStack.addBackground(color: #colorLiteral(red: 0.03127166256, green: 0.3580123782, blue: 0.5299996734, alpha: 1))
        
        return cell
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
    }
    
}
