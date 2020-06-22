//
//  SituationCollectionViewController_1.swift
//  Recipick
//
//  Created by SangU on 2017. 5. 26..
//  Copyright © 2017년 ChefKim. All rights reserved.
//
/*
import UIKit

//typealias Situation = (thumbnail:String, name:String, situation:Recipe.Situation)

class SituationCollectionViewController_1: UICollectionViewController {
    
    var situations:[Situation] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "SituationCell")

        // Do any additional setup after loading the view.
        
        situations += [Situation(thumbnail:"icon_situ_party", name:"집에서 준비하는 파티음식", situation:Recipe.Situation.Party), Situation(thumbnail:"icon_situ_dinner", name:"근사한 저녁식사", situation:Recipe.Situation.Dinner), Situation(thumbnail:"icon_situ_diet", name:"다이어트 중이에요", situation:Recipe.Situation.Diet), Situation(thumbnail:"icon_situ_summer", name:"더운 여름 이겨내기", situation:Recipe.Situation.Summer), Situation(thumbnail:"icon_situ_breakfast", name:"빠르고 든든한 아침식사", situation:Recipe.Situation.Breakfast), Situation(thumbnail:"icon_situ_sick", name:"몸이 좋지 않을 때", situation:Recipe.Situation.Sick)]
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
        return situations.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SituationCell", for: indexPath) as! SituationCollectionViewCell
    
        // Configure the cell
        let situation = Array(situations)[indexPath.row]
        let thumbnail:UIImage = UIImage(named: situation.thumbnail)!
        
        cell.situation = situation.situation
        cell.nameLabel.text = situation.name
        cell.situationImageView.image = thumbnail
 
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

}

class SituationCollectionViewCell:UICollectionViewCell {
    
    @IBOutlet weak var situationImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var situation: Recipe.Situation? = nil
    
    var situationForCell:Situation? { didSet{
        setUpCell()
        }}
    
    func setUpCell() {
        guard let situation = situationForCell else {
            return
        }
        
        situationImageView.image = UIImage(named: situation.thumbnail)
        nameLabel.text = situation.name
    }
}
*/

