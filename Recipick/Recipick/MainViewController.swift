//
//  MainViewController.swift
//  Recipick
//
//  Created by ParkDongHyuck on 2017. 5. 25..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit
import Firebase

var searchHistory:[String] = []
var likeList:[Recipe] = []
var ref : DatabaseReference!
var refHandle : DatabaseHandle!

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    // 상단 추천레시피 태그를 위한 임시 데이터셋
    let tagIdentifier = "recipeTag"
    var temporaryTags:[String] = []
    let tagList = ["치즈", "요거트", "우유", "생크림", "생선", "어묵", "조개", "오징어", "쌈채소", "호박", "감자", "고구마", "쇠고기", "닭고기", "달걀", "김치", "밥", "과일", "파티", "저녁식사", "다이어트", "아침", "아플 때", "안주", "백반", "당충전", "생일상", "한식", "중식", "일식", "양식", "디저트"]
    
    @IBAction func mainCenterClicked(_ sender: Any) {
        selectedRecipe = KimchSoup
        performSegue(withIdentifier: "MainToRecipe", sender: self)
    }
    
    //let randomNumber = arc4random_uniform(UInt32(colorArray.count))
    // 하단 추천레시피 셀을 위한 임시 데이터셋
    let cellIdentifier = "recipeCell"
    
    @IBOutlet weak var recommendedTag: UICollectionView!
    
    @IBOutlet weak var navigationLogo: UIImageView!
    
    @IBOutlet weak var recommendedTitleRecipe: UIImageView!

    @IBOutlet weak var recommendedSubRecipe: UICollectionView!
    
    @IBAction func moveToMypage(_ sender: Any) {
        self.performSegue(withIdentifier: "segueMypage", sender: self)
    }
    

    var sizingCell: RecommendedTagCollectionViewCell?

    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        while temporaryTags.count < 13 {
            let randomNumber = arc4random_uniform(UInt32(tagList.count))
            if !temporaryTags.contains(tagList[Int(randomNumber)]) {
                temporaryTags.append(tagList[Int(randomNumber)])
            }
        }
        
        if collectionView == self.recommendedTag {
            return self.temporaryTags.count
        }
        
        else {
            return 9
        }
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.recommendedTag {
            // get a reference to our storyboard cell
            let recipeTag = collectionView.dequeueReusableCell(withReuseIdentifier: tagIdentifier, for: indexPath as IndexPath) as! RecommendedTagCollectionViewCell
            self.configureCell(cell: recipeTag, forIndexPath: indexPath)
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            recipeTag.layer.cornerRadius = 13.5
            
            return recipeTag
        }
            
        else {
            let recipeCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath as IndexPath) as! RecommendedCollectionViewCell
            recipeCell.RecommendedCellLabel.text = recipeList[indexPath.row].name
            recipeCell.RecommendedCellImage.image = recipeList[indexPath.row].urlToPhoto(index: 0)
            recipeCell.layer.borderWidth = 1
            recipeCell.layer.borderColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0).cgColor
            
            return recipeCell
        }
    }
    
    func configureCell(cell: RecommendedTagCollectionViewCell, forIndexPath indexPath: IndexPath) {
        let tag = temporaryTags[indexPath.row]
        cell.recommendedTagLabel.text = "# " + tag
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.recommendedTag {
            self.configureCell(cell: self.sizingCell!, forIndexPath: indexPath as IndexPath)
            
            return self.sizingCell!.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        }
        
        else {
            return CGSize(width: view.frame.size.width/3 - 17, height: view.frame.size.width/3)
            
            // To get 1 column
            //return CGSize(width: view.frame.size.width, height: view.frame.size.width)
            
            // To get 2 column
            //return CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
        }
    }

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        recipeList += [Beefbureau, Fishpaste, PickledCucumber, KimchiFriedRice, ClamSoftTofuStew, FriedSpicyPork, FriedEggPlant, VongolePasta, BeefSeaweedSoup, Recipe10, Recipe11, Recipe12, Recipe13, Recipe14, Recipe15, Recipe16, Recipe17,Recipe18, Recipe19, Recipe20, Recipe21, Recipe22, Recipe23, Recipe24, Recipe25,Recipe26, Recipe27, Recipe28, Recipe29, Recipe30, Recipe31, Recipe32, Recipe33, Recipe34, Recipe35, Recipe36, Recipe37, Recipe38, Recipe39, Recipe40 ]
        
        //Firebase에서 데이터 가져오기
        ref = Database.database().reference()
        
        refHandle = ref.child("Recipe").observe(.childAdded, with: { (snapshot) in
            let data = snapshot.value as! [String: AnyObject]
            
            var recipe = Recipe(id: " ", name: " ", ingrediant: [Recipe.Ingrediant.Beef], time: Recipe.Time.Day, situation: Recipe.Situation.Birth, category: Recipe.Category.Japanese, recipe_ingrediant: " ", recipe_contents: " ", photo: [" "])
            
            if let recieveId = data["id"],
            let recieveName = data["name"],
            let recieveIngre = data["ingredients"],
            let recieveSituation = data["situation"],
            let recieveTime = data["time"],
            let recieveType = data["type"],
            let recieveDetailIngre = data["upDetailIngredient"],
            let recieveDetailRecipe = data["upDetailRecipe"],
            let recievePhoto = data["upPhotoURL"]{
            
            let convId = recieveId as! String
            let convName = recieveName as! String
            let convIngre = convertIngre(inputData: recieveIngre as! NSArray)
            let convTime = convertTime(inputData: recieveTime as! String)
            let convSitu = convertSitu(inputData: recieveSituation as! String)
            let convCate = convertCategory(inputData: recieveType as! String)
            let convDetailIngre = recieveDetailIngre as! String
            let convDetailRecipe = recieveDetailRecipe as! String
            let convPhotoURL = convertPhotoURL(inputData: recievePhoto as! NSArray)
            
            recipe = Recipe(id: convId,
                            name: convName,
                            ingrediant: convIngre,
                            time: convTime,
                            situation: convSitu,
                            category: convCate,
                            recipe_ingrediant: convDetailIngre,
                            recipe_contents: convDetailRecipe,
                            photo: convPhotoURL)
            
            g_RecipeData[snapshot.key] = recipe
            recipeList += Array(g_RecipeData.values)
            }
        
        })

        
        // Do any additional setup after loading the view.
        
        navigationLogo.image = UIImage(named: "logo")
        
        let cellNib = UINib(nibName: "RecommendedTagCollectionViewCell", bundle: nil)
        self.recommendedTag.register(cellNib, forCellWithReuseIdentifier: "recipeTag")
        self.recommendedTag.backgroundColor = UIColor.clear
    
        self.sizingCell = (cellNib.instantiate(withOwner: nil, options: nil) as NSArray).firstObject as! RecommendedTagCollectionViewCell?
        
        self.recommendedTag.collectionViewLayout = UICollectionViewFlowLayout()
        
//        self.recommendedTag.frame = self.view.frame
//        self.view.addSubview(self.recommendedTag!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var selectedTag:String!
    var selectedRecipe:Recipe!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == recommendedTag {
            selectedTag = temporaryTags[indexPath.row]
            performSegue(withIdentifier: "MainToTag", sender: self)
        }
        else {
            selectedRecipe = recipeList[indexPath.row]
            performSegue(withIdentifier: "MainToRecipe", sender: self)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        ref.removeObserver(withHandle: refHandle!)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "MainToTag" {
        var has:Bool = false
            if let toTag = segue.destination as? TagViewController {
                var list:[Recipe] = []
                for recipe in recipeList {
                    if (recipe.name.range(of: selectedTag) != nil) || (recipe.category.toString().range(of: selectedTag) != nil) || (recipe.situation.toString().range(of: selectedTag) != nil) {
                        for temp in list {
                            if temp.id == recipe.id {
                                has = true
                                break
                            }
                        }
                        if has == false {
                            list.append(recipe)
                        }
                    }
                    for ingrediant in recipe.ingrediant {
                        if (ingrediant.toString().range(of: selectedTag) != nil) {
                            for temp in list {
                            if temp.id == recipe.id {
                                has = true
                                break
                            }
                            }
                            if has == false {
                                list.append(recipe)
                            }
                            
                        }
                    }
                }
                toTag.tagList = list
                toTag.tagTitle = selectedTag
            }
       } else if segue.identifier == "MainToRecipe" {
            if let toRecipe = segue.destination as? RecipeViewController {
                toRecipe.recipe = selectedRecipe
            }
        }
         
    }
    
}
