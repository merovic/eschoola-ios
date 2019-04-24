//
//  SchoolFeaturesCollectionViewCell.swift
//  Eschoola
//
//  Created by Apple on 4/17/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

class SchoolFeaturesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        return layoutAttributes
    }
}
