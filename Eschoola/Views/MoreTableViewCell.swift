//
//  MoreTableViewCell.swift
//  NanoSchool
//
//  Created by Apple on 3/14/19.
//  Copyright © 2019 Walidghonem. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    
    @IBOutlet weak var moreImage: UIImageView!
    @IBOutlet weak var moreTitle: UILabel!
    @IBOutlet weak var moreDate: UILabel!
    @IBOutlet weak var moreDetails: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
