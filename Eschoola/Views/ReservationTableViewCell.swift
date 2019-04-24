//
//  ReservationTableViewCell.swift
//  Eschoola
//
//  Created by Apple on 4/20/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit
import BEMCheckBox

class ReservationTableViewCell: UITableViewCell {

    @IBOutlet weak var itemContainer: UIView!
    @IBOutlet weak var imageContainer: UIView!
    
    @IBOutlet weak var requestName: UILabel!
    @IBOutlet weak var requestDate: UILabel!
    @IBOutlet weak var requestStatus: UILabel!
    
    @IBOutlet weak var schoolLogo: UIImageView!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var kidName: UILabel!
    @IBOutlet weak var kidGenderLevel: UILabel!
    
    @IBOutlet weak var booksCheckbox: BEMCheckBox!
    @IBOutlet weak var visaCheckbox: BEMCheckBox!
    @IBOutlet weak var uniformCheckbox: BEMCheckBox!
    @IBOutlet weak var esdiscountCheckbox: BEMCheckBox!
    @IBOutlet weak var busCheckbox: BEMCheckBox!
    
    @IBOutlet weak var booksText: UILabel!
    @IBOutlet weak var visaText: UILabel!
    @IBOutlet weak var uniformText: UILabel!
    @IBOutlet weak var discountText: UILabel!
    @IBOutlet weak var busText: UILabel!
    
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var discountAmountText: UILabel!
    @IBOutlet weak var paidAmountText: UILabel!
    
    @IBOutlet weak var amountsStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
