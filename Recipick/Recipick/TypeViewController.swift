//
//  TypeViewController.swift
//  Recipick
//
//  Created by SangU on 2017. 5. 26..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

typealias Type = (thumbnail:String, name:String, type:Recipe.Category)

class TypeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var TypeCollectionView: UICollectionView!
    var types:[Type] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

 //       self.title = "상황별 레시피"
        
        // Do any additional setup after loading the view.
        types += [Type(thumbnail:"icon_type_korean", name:"한식", type:Recipe.Category.Korean), Type(thumbnail:"icon_type_chinese", name:"중식", type:Recipe.Category.Chinese), Type(thumbnail:"icon_type_japanese", name:"일식", type:Recipe.Category.Japanese), Type(thumbnail:"icon_type_western", name:"양식", type:Recipe.Category.Western), Type(thumbnail:"icon_type_global", name:"세계음식", type:Recipe.Category.Global), Type(thumbnail:"icon_type_dessert", name:"디저트", type:Recipe.Category.Dessert)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return types.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeCell", for: indexPath) as! TypeCollectionViewCell
        
        let type = Array(types)[indexPath.row]
        let thumbnail:UIImage = UIImage(named: type.thumbnail)!
        
        
        cell.type = type.type
        cell.nameLabel.text = type.name
        cell.typeImageView.image = thumbnail
        
        // add underline of cells
        if indexPath.row < types.count - 2 {
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
    
    var selectedType:Recipe.Category!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedType = types[indexPath.row].type
        print(indexPath.row)
        performSegue(withIdentifier: "TypeToTag", sender: self)
    }
    
    // set cell's size relatively
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TypeToTag" {
            if let toTag = segue.destination as? TagViewController {
                var tagList:[Recipe]
                
                tagList = recipeList.filter { $0.category == selectedType }
                
                toTag.tagList = tagList
                print(selectedType.toString())
                toTag.tagTitle.append(selectedType.toString())
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

