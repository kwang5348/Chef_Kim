//
//  LikeViewController.swift
//  Recipick
//
//  Created by SangU on 2017. 6. 15..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

class LikeViewController: UIViewController {
    var chosenRecipe:Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "내가 찜한 레시피"
        // Do any additional setup after loading the view.
        
        self.navigationController!.navigationBar.topItem!.title = ""
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 18.0, weight: UIFontWeightSemibold), NSForegroundColorAttributeName: UIColor.white]
        
        let backImg: UIImage = UIImage(named: "ui_back")!
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backImg, for: .normal, barMetrics: .default)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return likeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikeCell", for: indexPath) as! LikeCollectionViewCell
        
        // Configure the cell
        
        let like = likeList[indexPath.row]
        let thumbnail:UIImage?
        
        thumbnail = like.urlToPhoto(index: 0)
        
        for recipe in likeList {
            if recipe.id == like.id {
                cell.buttonLike.setImage(UIImage(named:"ui_like"), for: .normal)
            }
        }
        
        
        cell.nameLabel.text = like.name
        cell.likeImageView.image = thumbnail
        cell.recipe = like
        
        // add underline of cells
        if indexPath.row < likeList.count - 2 {
            let bottomLine = CALayer()
            bottomLine.frame = CGRect.init(x: 0, y: cell.frame.height - 1, width: cell.frame.width, height: 1)
            bottomLine.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1).cgColor
            cell.layer.addSublayer(bottomLine)
        }
        
        // add middleline of cells
        if indexPath.row % 2 == 0 {
            let middleLine = CALayer()
            middleLine.frame = CGRect.init(x: cell.frame.width - 1, y: 0, width: 1, height: cell.frame.height)
            middleLine.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1).cgColor
            cell.layer.addSublayer(middleLine)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenRecipe = likeList[indexPath.row]
        performSegue(withIdentifier: "LikeToRecipe", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LikeToRecipe" {
            if let toRecipe = segue.destination as? RecipeViewController {
                toRecipe.recipe = chosenRecipe
            }
        }
    }

}


class LikeCollectionViewCell:UICollectionViewCell {
    
    @IBOutlet weak var buttonLike: UIButton!
    
    @IBOutlet weak var likeImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var recipe:Recipe!
    
    @IBAction func changeButton() {
        let buttonImage = UIImage(named: "ui_unlike")
        if buttonLike.currentImage == buttonImage {
            buttonLike.setImage(UIImage(named:"ui_like"), for: .normal)
            likeList.append(recipe)
        }
        else {
            buttonLike.setImage(UIImage(named:"ui_unlike"), for: .normal)
            recipeList = recipeList.filter() { $0 !== recipe }
        }
    }
    
    
    var likeForCell:Type? { didSet{
        setUpCell()
        }}
    
    func setUpCell() {
        guard let type = likeForCell else {
            return
        }
        
        likeImageView.image = UIImage(named: type.thumbnail)
        nameLabel.text = type.name
    }
}
