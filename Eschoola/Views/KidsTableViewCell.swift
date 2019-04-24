//
//  KidsTableViewCell.swift
//  Eschoola
//
//  Created by Apple on 4/19/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class KidsTableViewCell: UITableViewCell {

    @IBOutlet weak var kidNameText: UILabel!
    @IBOutlet weak var kidLevelText: UILabel!
    @IBOutlet weak var kidPic: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
