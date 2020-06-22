//
//  TagViewController.swift
//  Recipick
//
//  Created by SangU on 2017. 5. 26..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

class TagViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate  {

    @IBOutlet weak var tagCollection: UICollectionView!
    
    var tagList:[Recipe] = []
    var tagTitle:String = ""
    var chosenRecipe:Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = tagTitle
        // Do any additional setup after loading the view.
        
        let cellNib = UINib(nibName: "RecommendedTagCollectionViewCell", bundle: nil)
        
        self.tagCollection.register(cellNib, forCellWithReuseIdentifier: "recipeTag")

        self.navigationController!.navigationBar.topItem!.title = ""
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 18.0, weight: UIFontWeightSemibold), NSForegroundColorAttributeName: UIColor.white]
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return tagList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCollectionViewCell
        
        // Configure the cell
        
        let tag = tagList[indexPath.row]
        let thumbnail:UIImage?
        print(tag)
        thumbnail = tag.urlToPhoto(index: 0)
        
        for recipe in likeList {
            if recipe.id == tag.id {
                cell.buttonLike.setImage(UIImage(named:"ui_like"), for: .normal)
            }
        }
        
        
        cell.nameLabel.text = tag.name
        cell.tagImageView.image = thumbnail
        cell.recipeId.text = tag.id
        
        // add underline of cells
        if indexPath.row < tagList.count - 2 {
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
        chosenRecipe = tagList[indexPath.row]
        performSegue(withIdentifier: "TagToRecipe", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2, height: view.frame.size.height/3.5)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TagToRecipe" {
            if let toRecipe = segue.destination as? RecipeViewController {
                toRecipe.recipe = chosenRecipe
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
