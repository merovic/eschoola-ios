//
//  AboutSchoolViewController.swift
//  NanoSchool
//
//  Created by Apple on 3/14/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit
import SDWebImage

class AboutGuestSchoolViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var schoolFeatures = Array<SchoolFeaturesItem>()
    
    @IBOutlet weak var verticalLayoutConstrain: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        schoolFeatures.append(SchoolFeaturesItem(titleText: "Sports Facilities", backgroundURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554713196/sports.jpg", iconURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554716607/play_grounds_90x90.png"))
        
        schoolFeatures.append(SchoolFeaturesItem(titleText: "Libraries and Laps", backgroundURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554713202/libraries.jpg", iconURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554716607/library_90x90.png"))
        
        schoolFeatures.append(SchoolFeaturesItem(titleText: "International", backgroundURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554713206/bulding1.jpg", iconURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554716607/schooltype_90x90.png"))
        
        schoolFeatures.append(SchoolFeaturesItem(titleText: "American", backgroundURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554713243/bulding2.jpg", iconURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554716607/course_type_90x90.png"))
        
        schoolFeatures.append(SchoolFeaturesItem(titleText: "Boys and Girls", backgroundURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554714468/students.jpg", iconURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554716607/gender_90x90.png"))
        
        schoolFeatures.append(SchoolFeaturesItem(titleText: "ACSW Certificate", backgroundURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554713248/accreditation.png", iconURL: "https://res.cloudinary.com/dtec9smtu/image/upload/v1554716608/acswascapproved_90x90.png"))
        
        self.verticalLayoutConstrain.constant = 350;
        
        
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellsAcross: CGFloat = 3
        let spaceBetweenCells: CGFloat = 1
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        
        return CGSize(width: dim, height: dim)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return schoolFeatures.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SchoolFeaturesCollectionViewCell", for: indexPath) as!SchoolFeaturesCollectionViewCell
        
        cell.titleText.text = schoolFeatures[indexPath.row].titleText
        cell.backgroundImg.sd_setImage(with: URL(string: schoolFeatures[indexPath.row].backgroundURL!), placeholderImage: UIImage(named: "placeholder.png"))
        cell.iconImg.sd_setImage(with: URL(string: schoolFeatures[indexPath.row].iconURL!), placeholderImage: UIImage(named: "placeholder.png"))
        
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
