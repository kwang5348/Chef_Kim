//
//  DetailViewController.swift
//  Recipick
//
//  Created by SangU on 2017. 6. 8..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var clickedText: String?
    
    @IBOutlet var clickedLabel: UILabel!
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickedLabel.text = clickedText
    }
}
