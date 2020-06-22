//
//  MypageViewController.swift
//  Recipick
//
//  Created by ParkDongHyuck on 2017. 6. 2..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!

    @IBAction func backButtonAction(_ sender: Any) {
        // 뒤로가기 버튼 구현 (이전 스토리보드로 이동)
        present(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home") as UIViewController, animated: true, completion: nil)
    }
    
    @IBAction func likeListButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "LikeToTag", sender: self)
    }
    
    @IBOutlet weak var profileImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 프로필 이미지 영역 설정
        profileImg.layer.borderWidth = 1
        profileImg.layer.borderColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0).cgColor
        profileImg.layer.cornerRadius = profileImg.frame.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LikeToTag" {
            if let like = segue.destination as? TagViewController {
                like.tagList = likeList
                like.tagTitle = " # 내가 찜한 레시피"
            }
        }
    }

}
