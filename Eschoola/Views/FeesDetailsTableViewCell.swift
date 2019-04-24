//
//  FeesDetailsTableViewCell.swift
//  NanoSchool
//
//  Created by Apple on 3/13/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit

class FeesDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var levelName: UILabel!
    @IBOutlet weak var levelFees: UILabel!
    @IBOutlet weak var uniformFees: UILabel!
    @IBOutlet weak var booksFees: UILabel!
    @IBOutlet weak var busOneFees: UILabel!
    @IBOutlet weak var busTwoFees: UILabel!
    @IBOutlet weak var notes: UILabel!
    @IBOutlet weak var applyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
