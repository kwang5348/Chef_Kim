//
//  SituationViewController.swift
//  Recipick
//
//  Created by SangU on 2017. 5. 26..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

typealias Situation = (thumbnail:String, name:String, situation:Recipe.Situation)

class SituationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var situationCollectionView: UICollectionView!
    var situations:[Situation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.title = "종류별 레시피"
        // Do any additional setup after loading the view.
        
        situations += [Situation(thumbnail:"icon_situ_party", name:"집에서 준비하는 파티음식", situation:Recipe.Situation.Party), Situation(thumbnail:"icon_situ_dinner", name:"근사한 저녁식사", situation:Recipe.Situation.Dinner), Situation(thumbnail:"icon_situ_diet", name:"다이어트 중이에요", situation:Recipe.Situation.Diet), Situation(thumbnail:"icon_situ_summer", name:"더운 여름 이겨내기", situation:Recipe.Situation.Summer), Situation(thumbnail:"icon_situ_breakfast", name:"빠르고 든든한 아침식사", situation:Recipe.Situation.Breakfast), Situation(thumbnail:"icon_situ_sick", name:"몸이 좋지 않을 때", situation:Recipe.Situation.Sick)]
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return situations.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SituationCell", for: indexPath) as! SituationCollectionViewCell
        
        // Configure the cell
        let situation = Array(situations)[indexPath.row]
        let thumbnail:UIImage = UIImage(named: situation.thumbnail)!
        
        cell.situation = situation.situation
        cell.nameLabel.text = situation.name
        cell.situationImageView.image = thumbnail

        // add underline of cells
        if indexPath.row < situations.count - 2 {
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
    
    var selectedSituation:Recipe.Situation!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedSituation = situations[indexPath.row].situation
        print(selectedSituation.toString())
        performSegue(withIdentifier: "SituToTag", sender: self)
    }

    // set cell's size relatively
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SituToTag" {
            print(selectedSituation.toString())
            if let toTag = segue.destination as? TagViewController {
                var tagList:[Recipe]
                tagList = recipeList.filter { $0.situation == selectedSituation }
                toTag.tagList = tagList
                toTag.tagTitle = selectedSituation.toString()
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



