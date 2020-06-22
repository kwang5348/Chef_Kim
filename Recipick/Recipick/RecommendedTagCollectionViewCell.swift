//
//  RecommendedTagCollectionViewCell.swift
//  Recipick
//
//  Created by ParkDongHyuck on 2017. 6. 11..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

class RecommendedTagCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recommendedTagLabel: UILabel!
    @IBOutlet weak var tagLabelMaxConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor(red: 131/255, green: 147/255, blue: 202/255, alpha: 1)
        if self.recommendedTagLabel != nil {
            self.recommendedTagLabel.textColor = UIColor.white
            
        }
        
        if self.tagLabelMaxConstraint != nil {
            self.tagLabelMaxConstraint.constant = UIScreen.main.bounds.width - 8 * 2 - 8 * 2
            
        }
    }

}
