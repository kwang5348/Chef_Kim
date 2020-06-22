//
//  TimeListCell.swift
//  Recipick
//
//  Created by ParkDongHyuck on 2017. 6. 1..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

class TimeListCell: UITableViewCell {

    @IBOutlet weak var TimeCellImage: UIImageView!
    @IBOutlet weak var TimeCellLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
