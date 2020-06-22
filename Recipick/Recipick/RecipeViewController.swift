//
//  RecipeViewController.swift
//  Recipick
//
//  Created by SangU on 2017. 5. 31..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate {
    
    var recipe:Recipe = Recipe(id: "000", name: "뚝배기", ingrediant: [Recipe.Ingrediant.Beef], time: Recipe.Time.H1, situation: Recipe.Situation.Birth, category: Recipe.Category.Dessert, recipe_ingrediant: "예제", recipe_contents: "예제")
    
    var tagList:[Recipe] = []
    var selectTag:String = ""
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ingredientTagCollection: UICollectionView!
    
    @IBOutlet weak var photoCollection: UICollectionView!
    
    @IBOutlet weak var timeTag: UIButton!
    
    @IBOutlet weak var situationTag: UIButton!
    
    @IBOutlet weak var typeTag: UIButton!
    
    @IBOutlet weak var recipe_ingrediant: UITextView!
    
    @IBOutlet weak var recipe_content: UITextView!
    
    @IBAction func timeTagClicked (_sender: Any) {
        tagList.removeAll()
        for recipe_1 in recipeList {
            if recipe_1.time.toString() == timeTag.currentTitle {
                tagList.append(recipe_1)
            }
        }
        selectTag = recipe.time.toString()
        performSegue(withIdentifier: "recipeToTag", sender: self)
    }
    
    @IBAction func situationTagClicked (_sender: Any) {
        tagList.removeAll()
        for recipe_1 in recipeList {
            if recipe_1.situation.toString() == situationTag.currentTitle {
                tagList.append(recipe_1)
            }
        }
        selectTag = recipe.situation.toString()
        performSegue(withIdentifier: "recipeToTag", sender: self)
    }
    
    @IBAction func typeTagClicked (_sender: Any) {
        tagList.removeAll()
        for recipe_1 in recipeList {
            if recipe_1.category.toString() == typeTag.currentTitle {
                tagList.append(recipe_1)
            }
        }
        selectTag = recipe.category.toString()
        performSegue(withIdentifier: "recipeToTag", sender: self)
    }
    
    var sizingCell: RecommendedTagCollectionViewCell?
    
    override func viewDidLoad() {
        self.title = " # " + recipe.name
        //self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: recipe_ingrediant.font.fontName, size: 25)  ]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: label.font.fontName, size: 25)]
        
//        timeTag.setTitle(recipe.time.toString(), for: .normal)
//        situationTag.setTitle(recipe.situation.toString(), for: .normal)
//        typeTag.setTitle(recipe.category.toString(), for: .normal)
//        recipe_ingrediant.text = recipe.recipe_ingrediant
//        recipe_content.text = recipe.recipe_contents
        super.viewDidLoad()
        
        // Set collectionView Cells for each tag collection
        let cellNib = UINib(nibName: "RecommendedTagCollectionViewCell", bundle: nil)
        
        self.ingredientTagCollection.register(cellNib, forCellWithReuseIdentifier: "recipeTag")
        self.ingredientTagCollection.backgroundColor = UIColor.clear
        
        self.sizingCell = (cellNib.instantiate(withOwner: nil, options: nil) as NSArray).firstObject as! RecommendedTagCollectionViewCell?
        
        self.recipe_ingrediant.text = recipe.recipe_ingrediant
        self.recipe_content.text = recipe.recipe_contents
        
        self.recipe_ingrediant.isEditable = false
        //self.recipe_ingrediant.sizeToFit()
        //self.recipe_ingrediant.lineBreakMode = .byWordWrapping
        //self.recipe_ingrediant.numberOfLines = 3
        
        self.recipe_content.isEditable = true
        //self.recipe_content.sizeToFit()
        //self.recipe_content.lineBreakMode = .byWordWrapping
        //self.recipe_content.numberOfLines = 20
        
        timeTag.setTitle(" # " + recipe.time.toString(), for: .normal)
        timeTag.setTitleColor(UIColor.white, for: .normal)
        timeTag.layer.cornerRadius = 15
        timeTag.layer.borderWidth = 0
        timeTag.backgroundColor = UIColor(red: 131/255, green: 147/255, blue: 202/255, alpha: 1.0)
        timeTag.sizeToFit()
        
        situationTag.setTitle(" # " + recipe.situation.toString(), for: .normal)
        situationTag.setTitleColor(UIColor.white, for: .normal)
        situationTag.layer.cornerRadius = 15
        situationTag.layer.borderWidth = 0
        situationTag.backgroundColor = UIColor(red: 131/255, green: 147/255, blue: 202/255, alpha: 1.0)
        situationTag.sizeToFit()
        
        typeTag.setTitle(" # " + recipe.category.toString(), for: .normal)
        typeTag.setTitleColor(UIColor.white, for: .normal)
        typeTag.layer.cornerRadius = 15
        typeTag.layer.borderWidth = 0
        typeTag.backgroundColor = UIColor(red: 131/255, green: 147/255, blue: 202/255, alpha: 1.0)
        typeTag.sizeToFit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if collectionView == self.ingredientTagCollection {
            return self.recipe.ingrediant.count
        }
            
        else {
            guard let collection = self.recipe.photo  else {
                return 1
            }
            return collection.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.ingredientTagCollection {
            print("ingredi")
            let ingredientTag = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeTag", for: indexPath as IndexPath) as! RecommendedTagCollectionViewCell
            self.configureCell(cell: ingredientTag, forIndexPath: indexPath, type: self.recipe.ingrediant)
            
            ingredientTag.layer.borderColor = UIColor.clear.cgColor
            ingredientTag.layer.borderWidth = 0
            ingredientTag.backgroundColor = UIColor(red: 131/255, green: 147/255, blue: 202/255, alpha: 1.0)
            ingredientTag.layer.cornerRadius = 13.5
            
            return ingredientTag
        }
        
        else {
            print("photo")
            let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipePhotoCell", for: indexPath as IndexPath) as! RecipeViewPhotoCell
            
            if let photos = recipe.photo {
                let thumbnail:UIImage = recipe.urlToPhoto(index: indexPath.row)
                photoCell.recipeImage.image = thumbnail
            }
            else {
                photoCell.recipeImage.image = UIImage(named: "default")
            }
            return photoCell
        }
    }
    
    func configureCell(cell: RecommendedTagCollectionViewCell, forIndexPath indexPath: IndexPath, type: [Recipe.Ingrediant]) {
        let tag = type[indexPath.row]
        if cell.recommendedTagLabel != nil {
            cell.recommendedTagLabel.text = "# " + tag.toString()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.ingredientTagCollection {
            self.configureCell(cell: self.sizingCell!, forIndexPath: indexPath as IndexPath, type: self.recipe.ingrediant)
            
            return self.sizingCell!.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        }
            
        else {
            return CGSize(width: 125, height: 125)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tagList.removeAll()
        if collectionView == ingredientTagCollection {
            let selectedIngrediant = recipe.ingrediant[indexPath.row]
            for recipe in recipeList {
                for ingrediant in recipe.ingrediant {
                    if ingrediant == selectedIngrediant {
                        tagList.append(recipe)
                    }
                }
            }
            selectTag = selectedIngrediant.toString()
        }
        else {
            return
        }
        
        performSegue(withIdentifier: "recipeToTag", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeToTag" {
            if let destination = segue.destination as? TagViewController {
                destination.tagList = self.tagList
                destination.tagTitle = selectTag
                print("send to tag")
            }
        }
    }
    
}


class RecipeViewPhotoCell: UICollectionViewCell {
    @IBOutlet weak var recipeImage: UIImageView!
}
