//
//  ComparisonTableViewCell.swift
//  NanoSchool
//
//  Created by Apple on 3/14/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit

class ComparisonTableViewCell: UITableViewCell {

    @IBOutlet weak var compImage: UIImageView!
    @IBOutlet weak var pointOfComparison: UILabel!
    @IBOutlet weak var point1Text: UILabel!
    @IBOutlet weak var point2Text: UILabel!
    
    @IBOutlet weak var containerStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
