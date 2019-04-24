//
//  VisionTableViewCell.swift
//  Eschoola
//
//  Created by Apple on 4/16/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class VisionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var contentText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
