//
//  SituationCollectionViewCell.swift
//  Recipick
//
//  Created by SangU on 2017. 5. 26..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

class SituationCollectionViewCell:UICollectionViewCell {
    
    @IBOutlet weak var situationImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var situation: Recipe.Situation? = nil
    
    var situationForCell:Situation? { didSet{
        setUpCell()
        }}
    
    func setUpCell() {
        guard let situation = situationForCell else {
            return
        }
        
        situationImageView.image = UIImage(named: situation.thumbnail)
        nameLabel.text = situation.name
    }
}
