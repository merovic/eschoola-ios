//
//  CalendarTableViewCell.swift
//  NanoSchool
//
//  Created by Walidghonem on 6/7/18.
//  Copyright © 2018 Walidghonem. All rights reserved.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {

    
    @IBOutlet weak var eventDateEN: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDateAR: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
