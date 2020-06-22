//
//  UIRoundButton.swift
//  Recipick
//
//  Created by ParkDongHyuck on 2017. 5. 25..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import Foundation
import UIKit
import YNSearch

extension UIColor {
    convenience init(rgb: Int) {
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF),
            green: CGFloat((rgb >> 8) & 0xFF),
            blue: CGFloat(rgb & 0xFF),
            alpha: CGFloat((rgb >> 24) & 0xFF)
        )
    }
}

class UIRoundPrimaryButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        /*
         self.layer.cornerRadius: 모서리 둥글기를 결정합니다. 값이 커질 수록 모서리가 둥글둥글해집니다.
         self.backgroundColor: 버튼의 배경색을 결정합니다.
         self.tintColor: 버튼의 TextColor를 결정한다고 생각하시면 됩니다.
         self.layer.borderColor: 버튼의 외곽선 컬러를 결정합니다.
         self.layer.borderWidth: 버튼의 외곽선 두께를 결정합니다. 값이 커질 수록 외곽선이 두꺼워집니다.
         */
        self.layer.cornerRadius = 15
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .highlighted)
        //self.backgroundColor = randomColor()
    }
    
    /*open func randomColor() -> UIColor {
        let colorArray = [0x009999, 0x0099cc, 0x0099ff, 0x00cc99, 0x00cccc, 0x336699, 0x3366cc, 0x3366ff, 0x339966, 0x666666, 0x666699, 0x6666cc, 0x6666ff, 0x996666, 0x996699, 0x999900, 0x999933, 0x99cc00, 0x99cc33, 0x660066, 0x669933, 0x990066, 0xcc9900, 0xcc6600 , 0xcc3300, 0xcc3366, 0xcc6666, 0xcc6699, 0xcc0066, 0xcc0033, 0xffcc00, 0xffcc33, 0xff9900, 0xff9933, 0xff6600, 0xff6633, 0xff6666, 0xff6699, 0xff3366, 0xff3333]
        
        let randomNumber = arc4random_uniform(UInt32(colorArray.count))
        return UIColor(rgb: colorArray[Int(randomNumber)])
    }*/
}
