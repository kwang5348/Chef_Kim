//
//  Recipe.swift
//  Recipick
//
//  Created by SangU on 2017. 5. 19..
//  Copyright © 2017년 ChefKim. All rights reserved.
//
import Foundation
import UIKit

class Recipe {
    var id: String
    var name: String
    var ingrediant: [Ingrediant]
    var time: Time
    var situation: Situation
    var category: Category
    var recipe_ingrediant: String    // 데이터 저장 실행을 위해서 임시로 배열을 지웠습니다.
    var recipe_contents: String      //
    var photo: [String]?
    
    
    init (id: String, name: String, ingrediant: [Ingrediant], time: Time, situation: Situation, category: Category, recipe_ingrediant: String, recipe_contents:String) {
        self.id = id
        self.name = name
        self.ingrediant = ingrediant
        self.time = time
        self.situation = situation
        self.category = category
        self.recipe_ingrediant = recipe_ingrediant
        self.recipe_contents = recipe_contents
    }
    
    convenience init (id: String, name: String, ingrediant: [Ingrediant], time: Time, situation: Situation, category: Category, recipe_ingrediant: String, recipe_contents:String, photo: [String]) {
        self.init(id: id, name: name, ingrediant: ingrediant, time: time, situation: situation, category: category, recipe_ingrediant: recipe_ingrediant, recipe_contents: recipe_contents)
        self.photo = photo
    }
    
    
    enum Ingrediant {
        case Cheese
        case Yogurt
        case Milk
        case Cream
        
        case Fish
        case FishCake
        case Clam
        case Squid
        
        case Vege
        case Pumpkin
        case Potato
        case SweetPotato
        
        case Beef
        case Pork
        case Chicken
        
        case Egg
        case Kimchi
        case Rice
        case Fruit
        
        func toString() -> String {
            switch self {
            case .Cheese:
                return "치즈"
            case .Yogurt:
                return "요거트"
            case .Milk:
                return "우유"
            case .Cream:
                return "생크림"
                
            case .Fish:
                return "생선"
            case .FishCake:
                return "어묵"
            case .Clam:
                return "조개"
            case .Squid:
                return "오징어"
                
            case .Vege:
                return "쌈채소"
            case .Pumpkin:
                return "호박"
            case .Potato:
                return "감자"
            case .SweetPotato:
                return "고구마"
                
            case .Beef:
                return "쇠고기"
            case .Pork:
                return "돼지고기"
            case .Chicken:
                return "닭고기"
                
            case .Egg:
                return "달걀"
            case .Kimchi:
                return "김치"
            case .Rice:
                return "밥"
            case .Fruit:
                return "과일"
            }
        }
    }
    
    enum Time {
        case M10
        case M30
        case H1
        case H2
        case H3
        case Day
        
        func toString() -> String {
            switch self {
            case .M10:
                return "10분 내외"
            case .M30:
                return "30분 내외"
            case .H1:
                return "1시간"
            case .H2:
                return "2시간"
            case .H3:
                return "3시간 이상"
            case .Day:
                return "하루 이상"
            }
        }
    }
    
    enum Situation {
        case Party
        case Dinner
        case Diet
        case Summer
        case Breakfast
        case Sick
        case Snack
        case Home
        case Sugar
        case Birth
        
        func toString() -> String {
            switch self {
            case .Party:
                return "집에서 준비하는 파티 음식"
            case .Dinner:
                return "근사한 저녁식사"
            case .Diet:
                return "다이어트 중이에요!"
            case .Summer:
                return "더운 여름 이겨내기"
            case .Breakfast:
                return "빠르고 든든한 아침"
            case .Sick:
                return "몸이 좋지 않을 때"
            case .Snack:
                return "간단한 안주 모음"
            case .Home:
                return "집밥 생각나는 백반"
            case .Sugar:
                return "당충전이 필요해"
            case .Birth:
                return "생일상 차리기"
            }
        }
    }
    
    enum Category {
        case Korean
        case Japanese
        case Chinese
        case Western
        case Global
        case Dessert
        
        func toString () -> String {
            switch self {
            case .Korean:
                return "한식"
            case .Chinese:
                return "중식"
            case .Japanese:
                return "일식"
            case .Western:
                return "양식"
            case .Global:
                return "세계 음식"
            case .Dessert:
                return "디저트"
            }
        }
    }
    func urlToPhoto (index:Int) -> UIImage {
        if let image = photo?[index] {
            let url = URL(string: image)
            let data = try?Data(contentsOf: url!)
            if let imageData = data {
                let image = UIImage(data: imageData)
                return image!
            }
        }
        return UIImage(named: "default")!
    }
    
}
