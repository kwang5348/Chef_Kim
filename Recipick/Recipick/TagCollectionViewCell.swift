//
//  TagCollectionViewCell.swift
//  Recipick
//
//  Created by SangU on 2017. 5. 26..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

class TagCollectionViewCell:UICollectionViewCell {
    
    @IBOutlet weak var buttonLike: UIButton!
    
    @IBOutlet weak var tagImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var recipeId: UILabel!
    
    @IBAction func changeButton() {
        print("buttonclick")
        if buttonLike.currentImage == UIImage(named: "ui_unlike") {
            buttonLike.setImage(UIImage(named:"ui_like"), for: .normal)
            let recipe = recipeList.filter() { $0.id == recipeId.text}
            likeList.append(recipe[0])
            print(recipe[0].name)
        }
        else {
            print(recipeId)
            buttonLike.setImage(UIImage(named:"ui_unlike"), for: .normal)
            likeList = likeList.filter() { $0.id != recipeId.text }
        }
    }
    
    
    var tagForCell:Type? { didSet{
        setUpCell()
        }}
    
    func setUpCell() {
        guard let type = tagForCell else {
            return
        }
        
        tagImageView.image = UIImage(named: type.thumbnail)
        nameLabel.text = type.name
    }
}
