//
//  IngredientViewController.swift
//  Recipick
//
//  Created by ParkDongHyuck on 2017. 5. 25..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit
import AccordionMenuSwift

class IngredientViewController: AccordionTableViewController {
    

//    @IBOutlet weak var IngredientListTable: UITableView!
    
    let ingrediantsEnum = [Recipe.Ingrediant.Cheese, Recipe.Ingrediant.Yogurt, Recipe.Ingrediant.Milk, Recipe.Ingrediant.Cream, Recipe.Ingrediant.Fish, Recipe.Ingrediant.FishCake, Recipe.Ingrediant.Clam, Recipe.Ingrediant.Squid, Recipe.Ingrediant.Vege, Recipe.Ingrediant.Pumpkin,Recipe.Ingrediant.Potato, Recipe.Ingrediant.SweetPotato, Recipe.Ingrediant.Beef, Recipe.Ingrediant.Pork, Recipe.Ingrediant.Chicken, Recipe.Ingrediant.Egg, Recipe.Ingrediant.Kimchi, Recipe.Ingrediant.Rice, Recipe.Ingrediant.Fruit]
    
    let ingrediants:[String] = []

    let ingredients = ["유제품","고기","야채"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        IngredientListTable.dataSource = self
//        IngredientListTable.delegate = self
        
        let item1 = Parent(state: .collapsed, childs: ["치즈", "요거트", "우유", "생크림"], title: "유제품", image: "milk")
        let item2 = Parent(state: .collapsed, childs: ["생선", "조개", "오징어"], title: "해산물", image: "fish")
        let item3 = Parent(state: .collapsed, childs: ["쌈채소", "호박", "감자", "고구마"], title: "야채", image: "vege")
        let item4 = Parent(state: .collapsed, childs: ["쇠고기", "돼지고기", "닭고기"], title: "고기", image: "meat")
        let item5 = Parent(state: .collapsed, childs: [], title: "계란", image: "egg") // No childs for this cell
        let item6 = Parent(state: .collapsed, childs: [], title: "김치", image: "kimchi")
        let item7 = Parent(state: .collapsed, childs: [], title: "밥", image: "rice")
        let item8 = Parent(state: .collapsed, childs: [], title: "과일", image: "fruit")
        
        dataSource = [item1, item2, item3, item4, item5, item6, item7, item8]
        numberOfCellsExpanded = .several
        total = dataSource.count
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 여기에 어떻게 값을 넣을지모르겠어
//    var selectedIngrediant:String!
    var selectedIngrediantIndex:String!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var tagList:[Recipe] = []
        selectedIngrediantIndex = String(super.selectedIndex)
        print("selectedIndex:" + selectedIngrediantIndex)
        
        if segue.identifier == "IngrediantToTag" {
            if let toTag = segue.destination as? TagViewController {
                for recipe in recipeList {
                    for ingredient in recipe.ingrediant {
                        if ingredient.toString() == selectedIngrediantIndex {
                            tagList.append(recipe)
                        }
                    }
                }
                print(tagList.count)
                toTag.tagList = tagList
                toTag.tagTitle = selectedIngrediantIndex
            }
        }
    }
    override func performSegueIngrediantToTag() {
        print("dajsdf")
        performSegue(withIdentifier: "IngrediantToTag", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var tagList:[Recipe] = []
//        if segue.identifier == "IngrediantToTag" {
//            if let toTag = segue.destination as? TagViewController {
//                if let indexPath = IngredientListTable.indexPathForSelectedRow {
//                    for recipe in recipeList {
//                        for ingrediant in recipe.ingrediant {
//                            if ingrediant ==  ingrediantsEnum[indexPath.row] {
//                                tagList.append(recipe)
//                                break
//                            }
//                        }
//                    }
//                    toTag.tagList = tagList
//                    toTag.tagTitle = ingrediantsEnum[indexPath.row].toString()
//                }
//            }
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



/////////////////////////////////////////////////////////////////////////////
//// tableview의 datasource와 delegate 등록
//extension IngredientViewController: UITableViewDataSource{ // table row 갯수 (menu 배열의 갯수만큼)
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ingredients.count
//    } // 각 row 마다 데이터 세팅.
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 첫 번째 인자로 등록한 identifier, cell은 as 키워드로 앞서 만든 custom cell class화 해준다.
//        let cell = IngredientListTable.dequeueReusableCell(withIdentifier: "IngredientListCell", for: indexPath) as! IngredientListCell // 위 작업을 마치면 커스텀 클래스의 outlet을 사용할 수 있다.
//        cell.IngredientCellLabel.text = ingredients[indexPath.row]
//        cell.IngredientCellImage.image = UIImage(named: images[indexPath.row])
//        
//        return cell } }
//
//extension IngredientViewController: UITableViewDelegate{ }
