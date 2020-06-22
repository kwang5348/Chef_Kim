//
//  TypeCollectionViewController_1.swift
//  Recipick
//
//  Created by SangU on 2017. 5. 26..
//  Copyright © 2017년 ChefKim. All rights reserved.
//
/*
import UIKit

private let reuseIdentifier = "TypeCell"

//typealias Type = (thumbnail:String, name:String, type:Recipe.Category)

class TypeCollectionViewController_1: UICollectionViewController {
    
    var types:[Type] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        types += [Type(thumbnail:"icon_type_korean", name:"한식", type:Recipe.Category.Korean), Type(thumbnail:"icon_type_chinese", name:"중식", type:Recipe.Category.Chinese), Type(thumbnail:"icon_type_japanese", name:"일식", type:Recipe.Category.Japanese), Type(thumbnail:"icon_type_western", name:"양식", type:Recipe.Category.Western), Type(thumbnail:"icon_type_global", name:"세계음식", type:Recipe.Category.Global), Type(thumbnail:"icon_type_dessert", name:"디저트", type:Recipe.Category.Dessert)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return types.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TypeCollectionViewCell
        
        
        let type = Array(types)[indexPath.row]
        let thumbnail:UIImage = UIImage(named: type.thumbnail)!
        
        cell.type = type.type
        cell.nameLabel.text = type.name
        cell.typeImageView.image = thumbnail
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TypeSegue" {
            let nextScene = segue.destination as? TagCollectionViewController
            
            if let indexPath = self.collectionView.indexPathForSelectedRow {
                let selectedTag = types[indexPath.row]
                nextScene?.currentTag = selectedTag
            }
        }
    }*/

}

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
}*/
