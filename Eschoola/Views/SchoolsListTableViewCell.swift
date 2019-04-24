//
//  SchoolsListTableViewCell.swift
//  NanoSchool
//
//  Created by Apple on 3/12/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit

class SchoolsListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var schoolLogo: UIImageView!
    @IBOutlet weak var schoolLogoContainer: UIView!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var schoolsDesc: UILabel!
    @IBOutlet weak var schoolDistance: UILabel!
    @IBOutlet weak var compareButton: UIButton!
    @IBOutlet weak var isMale: UIImageView!
    @IBOutlet weak var isFemale: UIImageView!
    @IBOutlet weak var isSunny: UIImageView!
    @IBOutlet weak var isEvening: UIImageView!
    @IBOutlet weak var isCertificate: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
