//
//  TypeCollectionViewCell.swift
//  Recipick
//
//  Created by SangU on 2017. 5. 26..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

class TypeCollectionViewCell:UICollectionViewCell {
    
    @IBOutlet weak var typeImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var type: Recipe.Category? = nil
    
    var typeForCell:Type? { didSet{
        setUpCell()
        }}
    
    func setUpCell() {
        guard let type = typeForCell else {
            return
        }
        
        typeImageView.image = UIImage(named: type.thumbnail)
        nameLabel.text = type.name
    }
}
