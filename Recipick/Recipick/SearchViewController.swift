//
//  SearchViewController.swift
//  Recipick
//
//  Created by SangU on 2017. 6. 8..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit
import YNSearch


class SearchViewController: YNSearchViewController, YNSearchDelegate, YNSearchMainViewDelegate {

    @IBOutlet weak var textFieldView: YNSearchTextFieldView!
    @IBOutlet var searchView: YNSearchView!
    @IBOutlet weak var mainview: YNSearchMainView!
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backButtonAction(_ sender: Any) {
        // 뒤로가기 버튼 구현 (이전 스토리보드로 이동)
        present(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home") as UIViewController, animated: true, completion: nil)
    }
    
    var tagList:[Recipe] = []
    var selectedtag:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.topItem!.title = ""
        self.ynSearchView = searchView
        self.ynSearchTextfieldView = textFieldView
        
        backButton.setImage(UIImage(named: "ui_back"), for: .normal)
        backButton.frame = CGRect(x: 5, y: 30, width:15, height: 20)
        searchView.ynScrollView = scrollview
        searchView.ynSearchMainView = mainview
        //let ynSearch = YNSearch()
        
        // Do any additional setup after loading the view.
        
        let tags = ["치즈", "요거트", "우유", "생크림", "생선", "어묵", "조개", "오징어", "쌈채소", "호박", "감자", "고구마", "쇠고기", "돼지고기", "닭고기", "달걀", "김치", "밥", "과일", "파티", "저녁식사", "다이어트", "아침", "아플 때", "안주", "백반", "당충전", "생일상", "한식", "중식", "일식", "양식", "세계 음식", "디저트"]
        
        ynSerach.setCategories(value: tags)
        ynSerach.setSearchHistories(value: searchHistory)
        
        self.ynSearchinit()
        
        self.delegate = self
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        
        var nameList:[String] = []
        
        for recipe in recipeList {
            nameList.append(recipe.name)
        }
        
        self.initData(database: nameList)
        
        self.setYNCategoryButtonType(type: .colorful)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ynSearchListView(_ ynSearchListView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ynSearchView.ynSearchListView.dequeueReusableCell(withIdentifier: YNSearchListViewCell.ID) as! YNSearchListViewCell
        
            cell.searchLabel.text = self.ynSearchView.ynSearchListView.searchResultDatabase[indexPath.row]
        
        return cell
    }
    
    func ynSearchListView(_ ynSearchListView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let key = self.ynSearchView.ynSearchListView.searchResultDatabase[indexPath.row]
        searchHistory.append(key)
            // Call listview clicked based on key
        self.ynSearchView.ynSearchListView.ynSearchListViewDelegate?.ynSearchListViewClicked(key: key)
            
            // return object you set in database
        self.ynSearchView.ynSearchListView.ynSearchListViewDelegate?.ynSearchListViewClicked(object: self.ynSearchView.ynSearchListView.database[indexPath.row])
            
            // Append Search history
        self.ynSearchView.ynSearchListView.ynSearch.appendSearchHistories(value: key)
        
    }
    
    func ynSearchListViewDidScroll() {
        self.ynSearchTextfieldView.ynSearchTextField.endEditing(true)
    }
    
    
    func ynSearchHistoryButtonClicked(text: String) {
        //self.pushViewController(text: text)
        tagList.removeAll()
        selectedtag = text
        for recipe in recipeList {
            if recipe.name.range(of: text) != nil {
                tagList.append(recipe)
            }
        }
        for recipe in recipeList {
            for ingrediant in recipe.ingrediant {
                if ingrediant.toString().range(of: text) != nil {
                    tagList.append(recipe)
                }
            }
           
        }
        for recipe in recipeList {
            if recipe.category.toString().range(of: text) != nil || recipe.situation.toString().range(of: text) != nil {
                tagList.append(recipe)
            }
        }
        
        performSegue(withIdentifier: "tagSegue", sender: self)
    }
    
    func ynCategoryButtonClicked(text: String) {
        //self.pushViewController(text: text)
        var ingredientTag: Recipe.Ingrediant? = nil
        var situationTag: Recipe.Situation? = nil
        var typeTag: Recipe.Category? = nil
        let button:String = text[text.index(text.startIndex, offsetBy:2) ..< text.index(before:text.endIndex)]
        tagList.removeAll()
        switch button {
        case "치즈":
            ingredientTag = Recipe.Ingrediant.Cheese
            break
        case "요거트":
            ingredientTag = Recipe.Ingrediant.Yogurt
            break
        case "우유":
            ingredientTag = Recipe.Ingrediant.Milk
            break
        case "생크림":
            ingredientTag = Recipe.Ingrediant.Cream
            break
        case "생선":
            ingredientTag = Recipe.Ingrediant.Fish
            break
        case "어묵":
            ingredientTag = Recipe.Ingrediant.FishCake
            break
        case "조개":
            ingredientTag = Recipe.Ingrediant.Clam
            break
        case "오징어":
            ingredientTag = Recipe.Ingrediant.Squid
            break
        case "쌈채소":
            ingredientTag = Recipe.Ingrediant.Vege
            break
        case "호박":
            ingredientTag = Recipe.Ingrediant.Pumpkin
            break
        case "감자":
            ingredientTag = Recipe.Ingrediant.Potato
            break
        case "고구마":
            ingredientTag = Recipe.Ingrediant.SweetPotato
            break
        case "쇠고기":
            ingredientTag = Recipe.Ingrediant.Beef
            break
        case "돼지고기":
            ingredientTag = Recipe.Ingrediant.Pork
            break
        case "닭고기":
            ingredientTag = Recipe.Ingrediant.Chicken
            break
        case "달걀":
            ingredientTag = Recipe.Ingrediant.Egg
            break
        case "김치":
            ingredientTag = Recipe.Ingrediant.Kimchi
            break
        case "밥":
            ingredientTag = Recipe.Ingrediant.Rice
            break
        case "과일":
            ingredientTag = Recipe.Ingrediant.Fruit
            break
        default: break
        }
        
        if let tag = ingredientTag {
            for recipe in recipeList {
                for ingredient in recipe.ingrediant {
                    if ingredient == tag {
                        tagList += [recipe]
                        break
                    }
                }
            }
            selectedtag = tag.toString()
            performSegue(withIdentifier: "tagSegue", sender: self)
            return
        }
        
        
        switch button {
        case "파티":
            situationTag = Recipe.Situation.Party
        case "저녁식사":
            situationTag = Recipe.Situation.Dinner
        case "다이어트":
            situationTag = Recipe.Situation.Diet
        case "아침":
            situationTag = Recipe.Situation.Breakfast
        case "아플 때":
            situationTag = Recipe.Situation.Sick
        case "안주":
            situationTag = Recipe.Situation.Snack
        case "백반":
            situationTag = Recipe.Situation.Home
        case "당충전":
            situationTag = Recipe.Situation.Sugar
        case "생일상":
            situationTag = Recipe.Situation.Birth
        default: break
        }
        if let tag = situationTag {
            for recipe in recipeList {
                if recipe.situation == tag {
                    tagList += [recipe]
                    break
                }
            }
            selectedtag = tag.toString()
            performSegue(withIdentifier: "tagSegue", sender: self)
            return
        }
        
        switch button {
        case "한식":
            typeTag = Recipe.Category.Korean
        case "중식":
            typeTag = Recipe.Category.Chinese
        case "일식":
            typeTag = Recipe.Category.Japanese
        case "세계 음식":
            typeTag = Recipe.Category.Global
        case "디저트":
            typeTag = Recipe.Category.Dessert
        case "양식":
            typeTag = Recipe.Category.Western
        default: break
        }
        if let tag = typeTag {
            for recipe in recipeList {
                if recipe.category == tag {
                    tagList += [recipe]
                    break
                }
            }
            selectedtag = tag.toString()
            performSegue(withIdentifier: "tagSegue", sender: self)
            return
        }

    }
    
    func ynSearchListViewClicked(key: String) {
        //self.pushViewController(text: key)
        tagList.removeAll()
        selectedtag = key
        for recipe in recipeList {
            if recipe.name.range(of: key) != nil {
                tagList.append(recipe)
            }
        }
        
        performSegue(withIdentifier: "tagSegue", sender: self)
    }
    
    func ynSearchListViewClicked(object: Any) {
        print(object)
    }
    
    
    /*func pushViewController(text:String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TagViewController") as! DetailViewController

    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.tabBarController?.tabBar.isHidden = false
        if segue.identifier == "tagSegue" {
            if let destination = segue.destination as? TagViewController {
                destination.tagTitle = selectedtag
                destination.tagList = self.tagList
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

