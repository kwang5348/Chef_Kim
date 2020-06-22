//
//  Recipe_Data.swift
//  Recipick
//
//  Created by 김광남 on 2017. 5. 25..
//  Copyright © 2017년 ChefKim. All rights reserved.
//
import Foundation

var recipeList:[Recipe] = []

var g_RecipeData = [String:Recipe]()
var g_RecipeArray = [Recipe]()

// 메인 김치찌개

let KimchSoup = Recipe(id: "0", name: "7분 돼지김치찌개", ingrediant: [Recipe.Ingrediant.Kimchi, Recipe.Ingrediant.Pork], time: Recipe.Time.M30, situation: Recipe.Situation.Home, category: Recipe.Category.Korean, recipe_ingrediant: "양파, 마늘, 파, 고춧가루", recipe_contents: "1.돼지고기를 중간불에서 볶듯이 익혀줍니다.\r\n2.고기가 충분히 익고나면 고기의 두배 정도 되는 양의 김치를 적당한 크기로 썰어 함께 볶아줍니다.\r\n3.김치의 신맛을 덜기 위해 설탕을 적당량 부어주며 볶습니다.\r\n4.볶은 재료에 재료가 충분히 잠길 정도의 물을 붓고 끓여줍니다.\r\n5.물이 끓고나면 파와 양파를 썰어 익혀줍니다.\r\n6.싱거울 경우 소금으로, 너무 실 경우 설탕을 넣어주며 간을 맞추면 완성! ", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/7%E1%84%87%E1%85%AE%E1%86%AB%20%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8E%E1%85%B5.png?alt=media&token=dbe4c4c7-f13d-4423-a64b-30cc76cbd103"])




// 소고기 무국

let Beefbureau = Recipe(id: "1",
                        name: "소고기무국",
                        ingrediant: [Recipe.Ingrediant.Beef],
                        time: Recipe.Time.H1,
                        situation: Recipe.Situation.Home,
                        category: Recipe.Category.Korean,
                        recipe_ingrediant: "무 200g, 소고기 130g, 콩나물 180~200g, 대파1, 청량고추2, 다시마육수1.2L, 액젓1큰술, 소금, 후추, 식용유\r\n고기양념 : 고춧가루",
                        recipe_contents: "1.무는 먹기 좋은 크기로 나박나박 썰고 대파와 청량고추는 썰어주세요\r\n2.먹기 좋은 크기로 썰은 쇠고기에 위 분량의 양념대로 넣어 양념합니다\r\n3.팬에 식용유를 두르고 고기를 넣어 중약불에 볶아줍니다\r\n4.고기가 슬쩍 익으면 무를 넣어 함께 볶아줍니다\r\n5.고기가 완벽하게 익으면 육수와액젓 1큰술을 넣어 보글보글 끓여주세요\r\n무가 90%정도 익으면 콩나물을 넣어 국물에 잠기도록 정기를 해 준 후, 뚜껑을 열고 보글보글 끓여줍니다\r\n콩나물이 익으면 청양고추와 대파를 넣고 가볍게 섞어주고 마지막으로 소금과 후추의 간을 맞춰주면 소고기무국 황금레시피 완성이에요",
                        photo : ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/%E1%84%89%E1%85%A9%E1%84%80%E1%85%A9%E1%84%80%E1%85%B5%E1%84%86%E1%85%AE%E1%84%80%E1%85%AE%E1%86%A8.jpg?alt=media&token=4adfa214-fb5d-42c3-9d68-a30b1df28c88"])
//어묵국
let Fishpaste = Recipe(id: "2",
                       name: "어묵국",
                       ingrediant: [Recipe.Ingrediant.FishCake],
                       time: Recipe.Time.H1,
                       situation: Recipe.Situation.Breakfast,
                       category: Recipe.Category.Korean,
                       recipe_ingrediant: "어묵 230g, 무 180g, 대파 1/2, 멸치육수 1.2L 이상, 청량고추\r\n고기양념 : 고춧가루 3큰술, 마늘 1.5큰술, 맛술 1큰술, 국간장 2큰술, 후추 톡톡",
                       recipe_contents: "1.무는 먹기 좋은 크기로 나박나박 썰고 어묵을 먹기좋은 크기로 썰어주세요\r\n2.대파와 청량고추는 잘게 송송 썰어줍니다\r\n3.채에 받쳐 뜨거운 물을 부어주며 가볍게 헹구고 물기를 털어줍니다\r\n4.육수에 무를 넣어 보글보글 끓여주세요\r\n5.무가 투명하게 익어 동동 떠오르면 어묵을 넣어 함께 끓여주고 다시 국물이 끓으면 다진마늘 1큰술, 국간장 1큰술, 액젓 1큰술을 넣어 끓입니다\r\n6.무와 어묵이 충분히 익으면 대파와 청양고추를 넣어 짧게 끓여주세요",
                       photo : ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/%E1%84%8B%E1%85%A5%E1%84%86%E1%85%AE%E1%86%A8%E1%84%80%E1%85%AE%E1%86%A8.jpg?alt=media&token=166dd3de-cfde-478c-9a46-7980acd7bb53"])


//야채피클
let PickledCucumber = Recipe(id: "0003",
                             name: "야채피클",
                             ingrediant: [Recipe.Ingrediant.Vege],
                             time: Recipe.Time.M30,
                             situation: Recipe.Situation.Home,
                             category: Recipe.Category.Western,
                             recipe_ingrediant: "오이 4, 파프리카1, 당근1\r\n소스 : 물 3컵, 식초 1.5컵, 설탕 1.5컵, 소금 1.5큰술, 피클링스파이스 1큰술, 월계수잎 2~3장",
                             recipe_contents: "1.만들기에 앞서 유리병을 열탕소독해 물기를 싸악 말려 준비합니다\r\n2.오이, 당근, 파프리카는 깨끗하게 세척 후 가능하면 물기를 최대한 털어내고 먹기 좋은 크기로 썰어줍니다\r\n3.유리병에 최대한 차곡차곡하게 야채를담아주세요\r\n4.위 분량의 소스 재료를 냄비에 담고 설탕이 녹을 정도로만 살짝 끓여줍니다\r\n5.뜨거운 상태의 소스를 재료가 잠길 정도로 부어줍니다\r\n6.실온에서 하루 정도 숙성 후냉장고에 넣어 이삼일 후 먹으면 딱 맛있게 즐길 수 있어요",
                             photo : ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/%E1%84%8B%E1%85%A3%E1%84%8E%E1%85%A2%E1%84%91%E1%85%B5%E1%84%8F%E1%85%B3%E1%86%AF.jpg?alt=media&token=d9d4396e-9d58-4836-a83e-d0be3a0114ab"])
//김치볶음밥
let KimchiFriedRice = Recipe(id: "0004",
                             name: "김치볶음밥",
                             ingrediant: [Recipe.Ingrediant.Kimchi, Recipe.Ingrediant.Egg, Recipe.Ingrediant.Pork],
                             time: Recipe.Time.M30,
                             situation: Recipe.Situation.Home,
                             category: Recipe.Category.Korean,
                             recipe_ingrediant: "김치 150g, 햄 60g, 밥 1.3공기, 대파 1/2, 설탕 조금, 식용유, 고춧가루 1큰술, 간장 0.5~1큰술, 참기름 0.5큰술, 계란 1",
                             recipe_contents: "1.김치와 햄은 잘게 썰고 대파는 송송 썰어줍니다\r\n2.팬에 식용유를 두르고 예열이 되면 썰어놓은 햄을 넣어 달달 볶아줍니다\r\n3.햄이 노릇노릇 해지기 시작하면 송송 썬 대파를 넣어 함께 볶아주세요\r\n4.향긋하게 파기름향이 올라오면 김치, 고춧가루 1큰술, 설탕 0.3큰술을 넣어 볶아주세요\r\n5.취향에 따라 설탕량을 조절해 주세요\r\n6.김치가 살짝 숨이 죽으면 팬 한쪽으로 재료를 밀고 팬에 간장 0.5큰술을 부어 바글바글 끓으면 김치와 섞어 볶습니다\r\n7.김치가 적당히 볶아지면 불을 끄고 밥을 넣어 비비듯이 밥알을 풀어 섞어주세요",
                             photo : ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8E%E1%85%B5%E1%84%87%E1%85%A9%E1%86%A9%E1%84%8B%E1%85%B3%E1%86%B7%E1%84%87%E1%85%A1%E1%86%B8.jpg?alt=media&token=7c2405bb-84ff-43ff-8948-fc4644a37f25"])

//바지락 순두부찌개
let ClamSoftTofuStew = Recipe(id: "0005",
                              name: "바지락 순두부찌개",
                              ingrediant: [Recipe.Ingrediant.Clam, Recipe.Ingrediant.Egg],
                              time: Recipe.Time.H1,
                              situation: Recipe.Situation.Home,
                              category: Recipe.Category.Korean,
                              recipe_ingrediant: "순두부 1팩, 바지락 크게 한줌, 물(육수)300ml, 대파 1/2, 청양고추 1~2, 양파(소)1/3, 다진마늘 1.5큰술, 식용우, 고춧가루 2큰술, 국간장 0.5큰술, 액젓 1큰술, 소금, 후추",
                              recipe_contents: "1.양파는 가늘게 채 썰고 대파는 어슷하게 썰어줍니다\r\n2.청양고추는 잘게 송송 썰어줍니다\r\n3.해감한 바지락은 가볍게 비벼주며 여러 번 행군 후 물기를 털어 준비합니다\r\n4.냄비에 식용유를 적당히 두르고 양파, 다진마늘 1.5큰술, 고춧가루 2큰술을 넣어 중양불에서 타지 않도록 달달 볶아주세요\r\n5.양파가 살짝 숨이 죽기 시작하면 물 300 ~ 350ml와 액젓 1큰술, 국간장 0.5큰술을 함께 넣어 끓여주세요\r\n6.국물이 끓으면 바지락을 넣어 입이 벌어질 정도로만 끓여줍니다\r\n7.바지락 입이 벌어지면 바로 순두부를 숟가락으로 크게크게 떠 넣어 함께 끓입니다\r\n8.다시 국물이 끓으면 대파와 청양고추를 넣고 마지막으로 소금과 후추를 조금씩 넣어 간을 맞춰주면 순두부찌개 끓이는법 완성입니다",
                              photo : ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/%E1%84%87%E1%85%A1%E1%84%8C%E1%85%B5%E1%84%85%E1%85%A1%E1%86%A8%E1%84%89%E1%85%AE%E1%86%AB%E1%84%83%E1%85%AE%E1%84%87%E1%85%AE%E1%84%8D%E1%85%B5%E1%84%80%E1%85%A2.jpg?alt=media&token=a5cc3a46-6668-4bdb-a774-758bf0aec120"])

//제육볶음
let FriedSpicyPork = Recipe(id: "0006",
                            name: "재육볶음",
                            ingrediant: [Recipe.Ingrediant.Pork],
                            time: Recipe.Time.H3,
                            situation: Recipe.Situation.Dinner,
                            category: Recipe.Category.Korean,
                            recipe_ingrediant: "돼지앞다리살 600g, 양파(중소) 1, 대파 1/2, 청양고추 1, 홍고추 1, 고춧가루 1큰술, 올리고당 1큰술, 참기름 0.5큰술, 식용유\r\n밑간 : 매실액 2큰술, 간장 3큰술, 다진마늘 1큰술, 후추 톡톡",
                            recipe_contents: "1.양념장 : 고춧가루 3큰술, 고추장 2큰술, 간장 1큰술, 맛술 1큰술, 설탕 1큰술, 다진마늘 1큰술, 생감가루 조금, 후추 톡톡\r\n2.불고기용 돼지고기는키친타올을 이용해 핏물을 제거하고 먹기 좋은 크기로 썰어줍니다\r\n3.밑간 재료를 넣어 가볍게 버무리고 잠시 숙성시켜주세요\r\n4.재료 맛이 잘 어우러지도록 먼저, 양념재료를 더해 양념장을 만듭니다\r\n5.양파와 대파는 도톰하게 채 썰고 청양고추와 홍고추는 어슷하게 썰어주세요\r\n6.준비가 모두 끝나면 팬에 식용유를 살짝 두르고 밑간 한 돼지고기를 넣어뭉치지 않도록 풀며 볶아주세요\r\n7.고기가 70%정도 익으면 양념장을 넣어 고르게 어우러지도록 잘 섞으며 볶습니다\r\n8.양념이 잘 어우러지면 이어서 손질한 채소들을 넣어 함께 볶아줍니다\r\n9.야채 숨이 살짝 죽으면 불을 강하게 올리고 색감과 윤기를 살리기 위해 고춧가루 1큰술, 올리고당 1큰술을 넣어 수분을 날리며 볶습니다\r\n10.모든 재료가 잘 어우러지면 참기름 0.5큰술을 넣어 향을 살려주고 마무리하면 제육볶음 황금레시피 완성입니다",
                            photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/%E1%84%8C%E1%85%A6%E1%84%8B%E1%85%B2%E1%86%A8%E1%84%87%E1%85%A9%E1%86%A9%E1%84%8B%E1%85%B3%E1%86%B7.jpg?alt=media&token=368c13d1-bcd8-4d73-9974-321cbc9b053a"])

//가지볶음
let FriedEggPlant = Recipe(id: "0007",
                           name: "가지볶음",
                           ingrediant: [Recipe.Ingrediant.Vege],
                           time: Recipe.Time.H1,
                           situation: Recipe.Situation.Home,
                           category: Recipe.Category.Korean,
                           recipe_ingrediant: "가지 2, 양파(소) 1, 청양고추 1, 홍고추 1, 대파 1/2, 식용유, 고추기름, 두반장 2.5큰술, 굴소스 1큰술, 설탕 0.3 ~ 0.5큰술, 후추, 소금\r\n가지는 0.5cm 두께 정도로 얄팍하게 썰어줍니다",
                           recipe_contents: "1.양파는 먹기 좋은 크기로 썰고 대파는 잘게 송송 썰어주세요\r\n2.팬에 키친타올을 이용해 식용유를 바르듯이 얇게 코팅을 시키고 가지를 올려 앞뒤로 노릇하게 구워줍니다\r\n3.다시 팬에 식용유를 넉넉하게 두르고 대파를 넣어 달달 몪아 파기름을 만듭니다\r\n4.대파 숨이 죽고 향이 올라오면 양파, 청양고추, 홍고추를 넣어 함께 볶습니다\r\n5.양파가 슬쩍 익어가기 시작하면 구운 가지와 두반장 2.5큰술, 굴소스 1큰술 설탕 0.3 ~ 0.5 큰술을 넣어 고르게 섞으며 볶아주세요\r\n6.재료 숨이 조금 더 죽고 양념과 잘어우러지도록 볶다가 후추를 살짝 넣어 마무리해주면 완성이에요",
                           photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/%E1%84%80%E1%85%A1%E1%84%8C%E1%85%B5%E1%84%87%E1%85%A9%E1%86%A9%E1%84%8B%E1%85%B3%E1%86%B7.jpg?alt=media&token=bf99ab58-6ff3-416a-8916-5407b3c5c751"])

//봉골레파스타
let VongolePasta = Recipe(id: "0008",
                          name: "봉골레파스타",
                          ingrediant: [Recipe.Ingrediant.Clam],
                          time: Recipe.Time.H1,
                          situation: Recipe.Situation.Dinner,
                          category: Recipe.Category.Western,
                          recipe_ingrediant: "바지락 200g 1팩, 파스타 170g, 올리브오일, 다진마늘 3큰술, 건고추 1, 맛술 2큰술, 후추, 소금, 월계수잎 1 ~ 2장\r\n해감시킨 바지락은 바락바락 주물러 여러 번 헹궈 물기를 털어 준비합니다",
                          recipe_contents: "1.마른 고추는 짤막하게 똑똑 잘라주세요\r\n2.끓는 물에 소금을 넉넉하게 넣고 파스타를 넣어 적당히 삶아줍니다\r\n3.면이 삶아지는 동안 나머지 재료들을 볶아줍니다\r\n4.팬에 올리브오일을 넉넉하게 두르고 다진 마늘과 건고추, 월계수잎을 넣어 볶아주세요\r\n5.마늘의 고소한 향이 올라오면 손질한 바지락과 맛술 2큰술을 넣어 휘리릭 가볍게 섞어줍니다\r\n6.이어서 바로 뚜껑을 닫고 바지락 입이 벌어질 때까지 가열합니다\r\n7.바지락 입이 충분히 벌어지면 뚜껑을 열고 파스타와 면수 반국자를 넣어 고르게 섞으며 볶아주고 부족한 간은 소금으로 맞춰줍니다\r\n8.재료들이 잘 어우러지면 마지막으로 후추를 뿌려 마무리해주면 완성",
                          photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/%E1%84%87%E1%85%A9%E1%86%BC%E1%84%80%E1%85%A9%E1%86%AF%E1%84%85%E1%85%A6%E1%84%91%E1%85%A1%E1%84%89%E1%85%B3%E1%84%90%E1%85%A1.jpg?alt=media&token=5ee5e7f8-7616-4f79-82d6-e1b3b5a4d949"])

//소고기미역국
let BeefSeaweedSoup = Recipe(id: "0009",
                             name: "소고기미역국",
                             ingrediant: [Recipe.Ingrediant.Beef],
                             time: Recipe.Time.M30,
                             situation: Recipe.Situation.Home,
                             category: Recipe.Category.Korean,
                             recipe_ingrediant: "건미역 15g, 소고기 150g, 육수(물) 1.1L 이상, 참기름 1큰술, 다진마늘 1큰술, 국간장 1큰술, 멸치액젓 1클술, 참치액 1큰술, 소금\r\n밑간 : 국간장 1큰술, 후추 톡톡",
                             recipe_contents: "1.건미역에 물을 넉넉하게 부어 15 ~ 30분 정도 충분히 불려줍니다\r\n2.불린 미역은 가볍게 조물조물 주물러 물에 두세 번 헹궈내고 물기를 제거합니다\r\n3.소고기에 국간장 1큰술과 후추를 조금 넣어 밑간을 해주세요\r\n4.냄비에 참기름 1큰술을 두르고 고기를 넣어 가볍게 볶아줍니다\r\n5.핏기가 사라지면 물기를 제거한 미역과 국간장 1큰술을 넣어 함께 볶아주세요\r\n6.이어서 육수(물) 재료가 충분히 잠기도록 넉넉하게 부어 보글보글 끓입니다\r\n7.국물이 끓으면 다진마늘 1큰술, 액젓 1큰술, 참치액 1큰술을 추가로 넣어 끓여주세요\r\n8.다시 국물이 끓으면 중약불로 줄이고 뭉근하게 10분 정도 끓여준 후, 부족한 간은 소금으로 맞춰주면 미역국 맛있게 끓이믄법 완성이에요",
                             photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/%E1%84%89%E1%85%A9%E1%84%80%E1%85%A9%E1%84%80%E1%85%B5%E1%84%86%E1%85%B5%E1%84%8B%E1%85%A7%E1%86%A8%E1%84%80%E1%85%AE%E1%86%A8.jpg?alt=media&token=3c357125-f0dc-4c97-aa71-2ae908b79303"])

//베이컨볶음밥
let Recipe10 = Recipe(id: "10", name: "베이컨볶음밥", ingrediant: [Recipe.Ingrediant.Pork], time: Recipe.Time.M30, situation: Recipe.Situation.Breakfast, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/%E1%84%87%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8F%E1%85%A5%E1%86%AB%E1%84%87%E1%85%A9%E1%86%A9%E1%84%8B%E1%85%B3%E1%86%B7%E1%84%87%E1%85%A1%E1%86%B8.jpg?alt=media&token=118f0f60-93b1-4b80-99b7-c7a35af7048f"])

let Recipe11 = Recipe(id: "11", name:  "계절 쭈꾸미 달래 덮밥", ingrediant: [Recipe.Ingrediant.Squid], time: Recipe.Time.H1, situation: Recipe.Situation.Dinner, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test")

let Recipe12 = Recipe(id: "12", name: "깐풍우동", ingrediant: [Recipe.Ingrediant.Chicken], time: Recipe.Time.H1, situation: Recipe.Situation.Party, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/12%20%E1%84%81%E1%85%A1%E1%86%AB%E1%84%91%E1%85%AE%E1%86%BC%E1%84%8B%E1%85%AE%E1%84%83%E1%85%A9%E1%86%BC.jpg?alt=media&token=44aa8b81-7660-432b-afda-2c7c797eef5d"])

let Recipe13 = Recipe(id: "13", name: "백종원 감자짜글이", ingrediant: [Recipe.Ingrediant.Potato], time: Recipe.Time.H1, situation: Recipe.Situation.Home, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/13%20%E1%84%87%E1%85%A2%E1%86%A8%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%8B%E1%85%AF%E1%86%AB%20%E1%84%80%E1%85%A1%E1%86%B7%E1%84%8C%E1%85%A1%E1%84%8D%E1%85%A1%E1%84%80%E1%85%B3%E1%86%AF%E1%84%8B%E1%85%B5.jpg?alt=media&token=2af8f1b7-a4f8-4c2a-8aeb-d15ca581068a"])

let Recipe14 = Recipe(id: "14", name: "그릴후랑크&팬케이크", ingrediant: [Recipe.Ingrediant.Pork], time: Recipe.Time.M30, situation: Recipe.Situation.Breakfast, category: Recipe.Category.Western, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/14%20%E1%84%80%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AF%E1%84%92%E1%85%AE%E1%84%85%E1%85%A1%E1%86%BC%E1%84%8F%E1%85%B3%20%E1%84%91%E1%85%A2%E1%86%AB%E1%84%8F%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8F%E1%85%B3.jpg?alt=media&token=ebbad1e5-9223-43be-bdc5-c31cd2a1b0ba"])

let Recipe15 = Recipe(id: "15", name: "토마토파스타", ingrediant: [Recipe.Ingrediant.Vege], time: Recipe.Time.H1, situation: Recipe.Situation.Party, category: Recipe.Category.Western, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/15%20%E1%84%90%E1%85%A9%E1%84%86%E1%85%A1%E1%84%90%E1%85%A9%E1%84%91%E1%85%A1%E1%84%89%E1%85%B3%E1%84%90%E1%85%A1.jpg?alt=media&token=46031be2-d911-481a-abba-c5d03b2f4dd2"])

let Recipe16 = Recipe(id: "16", name: "치킨버섯커리", ingrediant: [Recipe.Ingrediant.Chicken], time: Recipe.Time.H3, situation: Recipe.Situation.Home, category: Recipe.Category.Japanese, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/16%20%E1%84%8E%E1%85%B5%E1%84%8F%E1%85%B5%E1%86%AB%E1%84%87%E1%85%A5%E1%84%89%E1%85%A5%E1%86%BA%E1%84%8F%E1%85%A5%E1%84%85%E1%85%B5.jpg?alt=media&token=f2624ddc-f3ba-464e-94fb-7bdea8330720"])

let Recipe17 = Recipe(id: "17", name: "피나콜라다", ingrediant: [Recipe.Ingrediant.Yogurt], time: Recipe.Time.M30, situation: Recipe.Situation.Sugar, category: Recipe.Category.Dessert, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/17%20%E1%84%91%E1%85%B5%E1%84%82%E1%85%A1%E1%84%8F%E1%85%A9%E1%86%AF%E1%84%85%E1%85%A1%E1%84%83%E1%85%A1.jpg?alt=media&token=4b378b9f-66bf-428e-b05f-e172a59b8eda"])

let Recipe18 = Recipe(id: "18", name: "돈까스", ingrediant: [Recipe.Ingrediant.Pork], time: Recipe.Time.H1, situation: Recipe.Situation.Dinner, category: Recipe.Category.Japanese, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/18%20%E1%84%83%E1%85%A9%E1%86%AB%E1%84%81%E1%85%A1%E1%84%89%E1%85%B3.jpg?alt=media&token=0ef6a146-d888-44ca-96d6-f18f5b5cbacf"])

let Recipe19 = Recipe(id: "19", name: "규동", ingrediant: [Recipe.Ingrediant.Egg,Recipe.Ingrediant.Beef], time: Recipe.Time.H1, situation: Recipe.Situation.Home, category: Recipe.Category.Japanese, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/19%20%E1%84%80%E1%85%B2%E1%84%83%E1%85%A9%E1%86%BC.jpg?alt=media&token=653d0af6-834b-4f53-8d79-78b1f97ab722"])

let Recipe20 = Recipe(id: "20", name: "참치김치볶음밥", ingrediant: [Recipe.Ingrediant.Fish, Recipe.Ingrediant.Kimchi], time: Recipe.Time.M30, situation: Recipe.Situation.Diet, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/20%20%E1%84%8E%E1%85%A1%E1%86%B7%E1%84%8E%E1%85%B5%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8E%E1%85%B5%E1%84%87%E1%85%A9%E1%86%A9%E1%84%8B%E1%85%B3%E1%86%B7%E1%84%87%E1%85%A1%E1%86%B8.jpg?alt=media&token=6a04d560-c0ff-4060-8910-f82e152c1bc0"])

let Recipe21 = Recipe(id: "21", name: "감자전", ingrediant: [Recipe.Ingrediant.Potato], time: Recipe.Time.H1, situation: Recipe.Situation.Snack, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/21%20%E1%84%80%E1%85%A1%E1%86%B7%E1%84%8C%E1%85%A1%E1%84%8C%E1%85%A5%E1%86%AB.jpg?alt=media&token=3ebcad20-018b-4e1c-8f54-4ebb6581b65c"])

let Recipe22 = Recipe(id: "22", name: "냉면", ingrediant: [Recipe.Ingrediant.Egg, Recipe.Ingrediant.Vege], time: Recipe.Time.M30, situation: Recipe.Situation.Summer, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/22%20%E1%84%82%E1%85%A2%E1%86%BC%E1%84%86%E1%85%A7%E1%86%AB.jpg?alt=media&token=0808503b-057a-4c6f-96fe-4a4242941352"])

let Recipe23 = Recipe(id: "23", name: "바지락마늘볶음밥", ingrediant: [Recipe.Ingrediant.Vege, Recipe.Ingrediant.Clam], time: Recipe.Time.M30, situation: Recipe.Situation.Home, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/23%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%8B%E1%85%A5%E1%84%86%E1%85%A1%E1%84%82%E1%85%B3%E1%86%AF%E1%84%87%E1%85%A9%E1%86%A9%E1%84%8B%E1%85%B3%E1%86%B7%E1%84%87%E1%85%A1%E1%86%B8.jpg?alt=media&token=5ca86f1b-97e5-455d-8fd2-53221c0a07a5"])

let Recipe24 = Recipe(id: "24", name: "콘햄치즈", ingrediant: [Recipe.Ingrediant.Pork, Recipe.Ingrediant.Cheese], time: Recipe.Time.M10, situation: Recipe.Situation.Snack, category: Recipe.Category.Global, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/24%20%E1%84%8F%E1%85%A9%E1%86%AB%E1%84%92%E1%85%A2%E1%86%B7%E1%84%8E%E1%85%B5%E1%84%8C%E1%85%B3.jpg?alt=media&token=18e7933f-3caf-4547-b76a-bbafc254a9a7"])

let Recipe25 = Recipe(id: "25", name: "참치마요", ingrediant: [Recipe.Ingrediant.Fish, Recipe.Ingrediant.Rice], time: Recipe.Time.M30, situation: Recipe.Situation.Home, category: Recipe.Category.Global, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/25%20%E1%84%8E%E1%85%A1%E1%86%B7%E1%84%8E%E1%85%B5%E1%84%86%E1%85%A1%E1%84%8B%E1%85%AD.jpg?alt=media&token=51d6c157-9b97-4cb7-bc0d-4a9c67168c91"])

let Recipe26 = Recipe(id: "26", name: "스팸동", ingrediant: [Recipe.Ingrediant.Pork, Recipe.Ingrediant.Rice], time: Recipe.Time.M30, situation: Recipe.Situation.Home, category: Recipe.Category.Japanese, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/26%20%E1%84%89%E1%85%B3%E1%84%91%E1%85%A2%E1%86%B7%E1%84%83%E1%85%A9%E1%86%BC.jpg?alt=media&token=d605647e-aaa7-4a3b-b764-1b9796d26bf7"])

let Recipe27 = Recipe(id: "27", name: "어묵볶음", ingrediant: [Recipe.Ingrediant.FishCake], time: Recipe.Time.H2, situation: Recipe.Situation.Home, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/27%20%E1%84%8B%E1%85%A5%E1%84%86%E1%85%AE%E1%86%A8%E1%84%87%E1%85%A9%E1%86%A9%E1%84%8B%E1%85%B3%E1%86%B7.jpg?alt=media&token=05b38f22-372a-4040-8f67-9dbd81b14fcc"])

let Recipe28 = Recipe(id: "28", name: "소고기 장조림", ingrediant: [Recipe.Ingrediant.Beef, Recipe.Ingrediant.Egg], time: Recipe.Time.Day, situation: Recipe.Situation.Home, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/28%20%E1%84%89%E1%85%A9%E1%84%80%E1%85%A9%E1%84%80%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%BC%E1%84%8C%E1%85%A9%E1%84%85%E1%85%B5%E1%86%B7.jpg?alt=media&token=4f240c17-b83c-4e1c-a35e-66484be5af14"])

let Recipe29 = Recipe(id: "29", name: "짜사이 무침", ingrediant: [Recipe.Ingrediant.Vege], time: Recipe.Time.M30, situation: Recipe.Situation.Breakfast, category: Recipe.Category.Chinese, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/29%20%E1%84%8D%E1%85%A1%E1%84%89%E1%85%A1%E1%84%8B%E1%85%B5%20%E1%84%86%E1%85%AE%E1%84%8E%E1%85%B5%E1%86%B7.jpg?alt=media&token=9c402b33-9c24-4ae1-a5ad-5fcdd6f05dfa"])

let Recipe30 = Recipe(id: "30", name: "프랑스 체리 클라푸티", ingrediant: [Recipe.Ingrediant.Cheese], time: Recipe.Time.H2, situation: Recipe.Situation.Party, category: Recipe.Category.Western, recipe_ingrediant: "test", recipe_contents: "test", photo:["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/30%20%E1%84%91%E1%85%B3%E1%84%85%E1%85%A1%E1%86%BC%E1%84%89%E1%85%B3%20%E1%84%8E%E1%85%A6%E1%84%85%E1%85%B5%20%E1%84%8F%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A1%E1%84%91%E1%85%AE%E1%84%90%E1%85%B5.jpg?alt=media&token=ff98cb6d-f47a-4e78-b63b-d2bb5291ef38"])

 let Recipe31 = Recipe(id: "31", name: "김치호박부침개", ingrediant: [Recipe.Ingrediant.Pumpkin, Recipe.Ingrediant.Pumpkin], time: Recipe.Time.H1, situation: Recipe.Situation.Snack, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/31%E1%84%80%E1%85%B5%E1%86%B7%E1%84%8E%E1%85%B5%E1%84%92%E1%85%A9%E1%84%87%E1%85%A1%E1%86%A8%E1%84%87%E1%85%AE%E1%84%8E%E1%85%B5%E1%86%B7%E1%84%80%E1%85%A2.jpg?alt=media&token=a5bbe90f-b707-4e9d-b682-af382a3dcf93"])
 
 let Recipe32 = Recipe(id: "32", name: "호박볶음", ingrediant: [Recipe.Ingrediant.Pumpkin], time: Recipe.Time.H1, situation: Recipe.Situation.Diet, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/32%E1%84%92%E1%85%A9%E1%84%87%E1%85%A1%E1%86%A8%E1%84%87%E1%85%A9%E1%86%A9%E1%84%8B%E1%85%B3%E1%86%B7.jpg?alt=media&token=095b0dfd-e077-4f0b-b56a-4301c5bd67cd"])
 
 let Recipe33 = Recipe(id: "33", name: "호박죽", ingrediant: [Recipe.Ingrediant.Pumpkin], time: Recipe.Time.H3, situation: Recipe.Situation.Sick, category: Recipe.Category.Dessert, recipe_ingrediant: "test", recipe_contents: "test", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/33%E1%84%92%E1%85%A9%E1%84%87%E1%85%A1%E1%86%A8%E1%84%8C%E1%85%AE%E1%86%A8.jpg?alt=media&token=d23d2b9c-db0d-4553-b480-a1295f414e2c"])
 
 let Recipe34 = Recipe(id: "34", name: "고구마 맛탕", ingrediant: [Recipe.Ingrediant.SweetPotato], time: Recipe.Time.H3, situation: Recipe.Situation.Sugar, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/34%E1%84%80%E1%85%A9%E1%84%80%E1%85%AE%E1%84%86%E1%85%A1%E1%84%86%E1%85%A1%E1%86%BA%E1%84%90%E1%85%A1%E1%86%BC.jpg?alt=media&token=c2faaa5a-88bf-40ed-9771-950bedb0abb2"])
 
let Recipe35 = Recipe(id: "35", name: "허니버터 고구마칩", ingrediant: [Recipe.Ingrediant.SweetPotato], time: Recipe.Time.H1, situation: Recipe.Situation.Home, category: Recipe.Category.Korean, recipe_ingrediant: "test", recipe_contents: "test", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/35%E1%84%92%E1%85%A5%E1%84%82%E1%85%B5%E1%84%87%E1%85%A5%E1%84%90%E1%85%A5%E1%84%80%E1%85%A9%E1%84%80%E1%85%AE%E1%84%86%E1%85%A1%E1%84%8E%E1%85%B5%E1%86%B8.jpg?alt=media&token=42bdc95e-cb53-4e77-8893-452a802603b3"])
 
 let Recipe36 = Recipe(id: "36", name: "고구마라떼", ingrediant: [Recipe.Ingrediant.SweetPotato], time: Recipe.Time.M30, situation: Recipe.Situation.Sugar, category: Recipe.Category.Dessert, recipe_ingrediant: "test", recipe_contents: "test", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/36%E1%84%80%E1%85%A9%E1%84%80%E1%85%AE%E1%84%86%E1%85%A1%E1%84%85%E1%85%A1%E1%84%84%E1%85%A6.jpg?alt=media&token=725f357a-8fae-4850-9048-ef8c652db8ba"])
 
 let Recipe37 = Recipe(id: "37", name: "오징어튀김", ingrediant: [Recipe.Ingrediant.Squid], time: Recipe.Time.H2, situation: Recipe.Situation.Snack, category: Recipe.Category.Global, recipe_ingrediant: "test", recipe_contents: "test", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/37%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%B5%E1%86%BC%E1%84%8B%E1%85%A5%E1%84%90%E1%85%B1%E1%84%80%E1%85%B5%E1%86%B7.jpg?alt=media&token=54ec240c-46fc-40f5-a89a-46327437780b"])
 
 let Recipe38 = Recipe(id: "38", name: "오징어덮밥", ingrediant: [Recipe.Ingrediant.Squid], time: Recipe.Time.H1, situation: Recipe.Situation.Breakfast, category: Recipe.Category.Japanese, recipe_ingrediant: "test", recipe_contents: "test", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/38%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%B5%E1%86%BC%E1%84%8B%E1%85%A5%E1%84%83%E1%85%A5%E1%87%81%E1%84%87%E1%85%A1%E1%86%B8.jpg?alt=media&token=27d00abe-8685-43e7-8dbd-6c05f7be2922"])
 
 let Recipe39 = Recipe(id: "39", name: "동파육", ingrediant: [Recipe.Ingrediant.Pork], time: Recipe.Time.Day, situation: Recipe.Situation.Party, category: Recipe.Category.Chinese, recipe_ingrediant: "test", recipe_contents: "test", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/39%E1%84%83%E1%85%A9%E1%86%BC%E1%84%91%E1%85%A1%E1%84%8B%E1%85%B2%E1%86%A8.jpg?alt=media&token=4d674e09-f059-4483-bd65-491688c399a6"])
 
 let Recipe40 = Recipe(id: "40", name: "깐풍기", ingrediant: [Recipe.Ingrediant.Pork], time: Recipe.Time.H2, situation: Recipe.Situation.Dinner, category: Recipe.Category.Chinese, recipe_ingrediant: "test", recipe_contents: "test", photo: ["https://firebasestorage.googleapis.com/v0/b/shefkim-d0b57.appspot.com/o/40%E1%84%81%E1%85%A1%E1%86%AB%E1%84%91%E1%85%AE%E1%86%BC%E1%84%80%E1%85%B5.jpg?alt=media&token=ea193615-79ba-4e69-ad75-172d65623d62"])
