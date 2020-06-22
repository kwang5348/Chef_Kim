//
//  convertDataForm.swift
//  Recipick
//
//  Created by 김광남 on 2017. 6. 13..
//  Copyright © 2017년 ChefKim. All rights reserved.
//

import Foundation


// 입력받은 ingredient 배열을 Firebase에 업로드시 영문으로 바꾸는 과정 ( 한글은 유니코드??로 바뀜 )
func upIngreData(inputData : [String]) -> [String]{
    var tempOutput : [String]?
    
    if tempOutput == nil {
        tempOutput = []
    }
    for i in 0 ..< inputData.count {
        switch inputData[i]{
        case "김치" :
            tempOutput?.append("kimci")
        case "계란" :
            tempOutput?.append("egg")
            
        case "치즈":
            tempOutput?.append("Cheese")
        case "요거트":
            tempOutput?.append("Yogurt")
        case "우유":
            tempOutput?.append("Milk")
        case "생크림":
            tempOutput?.append("Cream")
            
        case "생선":
            tempOutput?.append("Fish")
        case "어묵":
            tempOutput?.append("FishCake")
        case "조개":
            tempOutput?.append("Clam")
        case "오징어":
            tempOutput?.append("Squid")
            
        case "쌈채소":
            tempOutput?.append("Vege")
        case "호박":
            tempOutput?.append("Pumpkin")
        case "감자":
            tempOutput?.append("Potato")
        case "고구마":
            tempOutput?.append("SweetPotato")
            
        case "쇠고기":
            tempOutput?.append("Beef")
        case "돼지고기":
            tempOutput?.append("Pork")
        case "닭고기":
            tempOutput?.append("Chicken")
            
            // 김치와 달걀 중복 마무리전에 꼭 수정해야됨 아래것이 맞음
            /*
             case "달걀":
             tempOutput?.append("Egg")
             case "김치":
             tempOutput?.append("Kimchi")
             */
        case "밥":
            tempOutput?.append("Rice")
        case "과일":
            tempOutput?.append("Fruit")
            
        case "10분 내외":
            tempOutput?.append("M10")
        case "30분 내외":
            tempOutput?.append("M30")
        case "1시간":
            tempOutput?.append("H1")
        case "2시간":
            tempOutput?.append("H2")
        case "3시간 이상":
            tempOutput?.append("H3")
        case "하루 이상":
            tempOutput?.append("Day")
            
        case "집에서 준비하는 파티 음식":
            tempOutput?.append("Party")
        case "근사한 저녁식사":
            tempOutput?.append("Dinner")
        case "다이어트 중이에요!":
            tempOutput?.append("Diet")
        case "더운 여름 이겨내기":
            tempOutput?.append("Summer")
        case "빠르고 든든한 아침":
            tempOutput?.append("Breakfast")
        case "몸이 좋지 않을 때":
            tempOutput?.append("Sick")
        case "간단한 안주 모음":
            tempOutput?.append("Snack")
        case "집밥 생각나는 백반":
            tempOutput?.append("Home")
        case "당충전이 필요해":
            tempOutput?.append("Sugar")
        case "생일상 차리기":
            tempOutput?.append("Birth")
            
        case "한식":
            tempOutput?.append("Korean")
        case "중식":
            tempOutput?.append("Chinese")
        case "일식":
            tempOutput?.append("Japanese")
        case "양식":
            tempOutput?.append("Western")
        case "세계 음식":
            tempOutput?.append("Global")
        case "디저트":
            tempOutput?.append("Dessert")
            
        default:
            print("end")
        }
    }
    
    if let output = tempOutput{
        return output
    } else {
        return ["error"]
    }
}

//입력받은 time String을 영문으로 바꾸는 func
func upTimeData(inputData : String) -> String{
    
    var tempTime = "10분 내외"
    switch inputData{
        
    case "10분 내외":
        tempTime = "M10"
    case "30분 내외":
        tempTime = "M30"
    case "1시간":
        tempTime = "H1"
    case "2시간":
        tempTime = "H2"
    case "3시간 이상":
        tempTime = "H3"
    case "하루 이상":
        tempTime = "Day"
    default:
        print("end")
    }
    return tempTime
}

func upSituationData(inputData : String) -> String{
    
    var tempSitu = "집에서 준비하는 파티 음식"
    
    switch inputData{
        
    case "집에서 준비하는 파티 음식":
        tempSitu = "Party"
    case "근사한 저녁식사":
        tempSitu = "Dinner"
    case "다이어트 중이에요!":
        tempSitu = "Diet"
    case "더운 여름 이겨내기":
        tempSitu = "Summer"
    case "빠르고 든든한 아침":
        tempSitu = "Breakfast"
    case "몸이 좋지 않을 때":
        tempSitu = "Sick"
    case "간단한 안주 모음":
        tempSitu = "Snack"
    case "집밥 생각나는 백반":
        tempSitu = "Home"
    case "당충전이 필요해":
        tempSitu = "Sugar"
    case "생일상 차리기":
        tempSitu = "Birth"
    default:
        print("end")
    }
    return tempSitu
}

//입력받은 type String을 영문으로 바꾸는 func
func upTypeData(inputData : String) -> String{
    var tempType = "Korean"
    switch inputData{
    case "한식":
        tempType = "Korean"
    case "중식":
        tempType = "Chinese"
    case "일식":
        tempType = "Japanese"
    case "양식":
        tempType = "Western"
    case "세계 음식":
        tempType = "Global"
    case "디저트":
        tempType = "Dessert"
        
    default:
        print("end")
    }
    return tempType
}

//firebase의 영문으로 저장되어 있는 데이터를 enum 값으로 변환해주는 func
func convertIngre(inputData : NSArray) -> [Recipe.Ingrediant]{
    var temp_ingre:[Recipe.Ingrediant]?
    
    if temp_ingre == nil {
        temp_ingre = []
    }
    
    let convertArray = NSMutableArray(array: inputData)
    
    if let swiftArray = convertArray as NSArray as? [String]{
        
        for i in 0 ..< swiftArray.count {
            switch swiftArray[i] {
            case "Cheese":
                temp_ingre?.append(Recipe.Ingrediant.Cheese)
            case "Yogurt":
                temp_ingre?.append(Recipe.Ingrediant.Yogurt)
            case "Milk":
                temp_ingre?.append(Recipe.Ingrediant.Milk)
            case "Cream":
                temp_ingre?.append(Recipe.Ingrediant.Cream)
            case "Fish":
                temp_ingre?.append(Recipe.Ingrediant.Fish)
            case "FishCake":
                temp_ingre?.append(Recipe.Ingrediant.FishCake)
            case "Clam":
                temp_ingre?.append(Recipe.Ingrediant.Clam)
            case "Squid":
                temp_ingre?.append(Recipe.Ingrediant.Squid)
            case "Vege":
                temp_ingre?.append(Recipe.Ingrediant.Vege)
            case "Pumpkin":
                temp_ingre?.append(Recipe.Ingrediant.Pumpkin)
            case "Potato":
                temp_ingre?.append(Recipe.Ingrediant.Potato)
            case "SweetPotato":
                temp_ingre?.append(Recipe.Ingrediant.SweetPotato)
            case "Beef":
                temp_ingre?.append(Recipe.Ingrediant.Beef)
            case "Pork":
                temp_ingre?.append(Recipe.Ingrediant.Pork)
            case "Chicken":
                temp_ingre?.append(Recipe.Ingrediant.Chicken)
            case "egg":
                temp_ingre?.append(Recipe.Ingrediant.Egg)
            case "kimci":
                temp_ingre?.append(Recipe.Ingrediant.Kimchi)
                /*          마무리 전에 대체해야함
                 case "Egg":
                 temp_ingre?.append(Recipe.Ingrediant.Egg)
                 case "Kimchi":
                 temp_ingre?.append(Recipe.Ingrediant.Kimchi)*/
            case "Rice":
                temp_ingre?.append(Recipe.Ingrediant.Rice)
            case "Fruit":
                temp_ingre?.append(Recipe.Ingrediant.Fruit)
            default:
                print("end")
            }
        }
    }
    
    if let output = temp_ingre{
        return output
    } else {
        return [Recipe.Ingrediant.Beef]
    }
}

// firebase 에서 데이터 받아올때 time enum 으로 변환해주는 func
func convertTime(inputData : String) -> Recipe.Time{
    
    var tempTime = Recipe.Time.M10
    
    switch inputData {
    case "M10":
        tempTime = Recipe.Time.M10
    case "M30":
        tempTime = Recipe.Time.M30
    case "H1":
        tempTime = Recipe.Time.H1
    case "H2":
        tempTime = Recipe.Time.H2
    case "H3":
        tempTime = Recipe.Time.H3
    case "Day":
        tempTime = Recipe.Time.Day
    default:
        print("end")
    }
    return tempTime
}

// firebase 에서 데이터 받아올때 situation enum 으로 변환해주는 func
func convertSitu(inputData : String) -> Recipe.Situation{
    
    var tempSitu = Recipe.Situation.Party
    
    
    switch inputData {
    case "Party":
        tempSitu = Recipe.Situation.Party
    case "Dinner":
        tempSitu = Recipe.Situation.Dinner
    case "Diet":
        tempSitu = Recipe.Situation.Diet
    case "Summer":
        tempSitu = Recipe.Situation.Summer
    case "Breakfast":
        tempSitu = Recipe.Situation.Breakfast
    case "Sick":
        tempSitu = Recipe.Situation.Sick
    case "Snack":
        tempSitu = Recipe.Situation.Snack
    case "Home":
        tempSitu = Recipe.Situation.Home
    case "Sugar":
        tempSitu = Recipe.Situation.Sugar
    case "Birth":
        tempSitu = Recipe.Situation.Birth
        
    default:
        print("end")
    }
    
    return tempSitu
}

// firebase 에서 데이터 받아올때 category enum 으로 변환해주는 func
func convertCategory(inputData : String) -> Recipe.Category{
    
    var tempCateg = Recipe.Category.Global
    
    
    switch inputData {
        
    case "Korean":
        tempCateg = Recipe.Category.Korean
    case "Chinese":
        tempCateg = Recipe.Category.Chinese
    case "Japanese":
        tempCateg = Recipe.Category.Japanese
    case "Western":
        tempCateg = Recipe.Category.Western
    case "Global":
        tempCateg = Recipe.Category.Global
    case "Dessert":
        tempCateg = Recipe.Category.Dessert
    default:
        print("end")
    }
    return tempCateg
}

// firebase 에서 photo 데이터 받아올때 [String] 으로 변환해주는 func
func convertPhotoURL(inputData : NSArray) -> [String]{
    var temp_photo:[String]?
    
    if temp_photo == nil {
        temp_photo = []
    }
    
    let convertArray = NSMutableArray(array: inputData)
    
    if let swiftArray = convertArray as NSArray as? [String]{
        
        for i in 0 ..< swiftArray.count {
            temp_photo?.append(swiftArray[i])
        }
    }
    if let output = temp_photo{
        return output
    } else {
        return []
    }
}



