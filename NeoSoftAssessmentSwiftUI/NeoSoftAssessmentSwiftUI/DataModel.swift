//
//  DataModel.swift
//  NeoSoftAssessmentSwiftUI
//
//  Created by Mukta on 13/12/24.
//

import Foundation

struct Item : Hashable {
    let displayName: String
    let image: String
}
  

struct Category {
    let name: String
    let items: [Item]
}

struct DataModel {
    let images: [String]
    let categories: [Category]
}

let dataModel = DataModel(
    images: ["Nature1", "Nature2", "Nature3"],
    categories: [
        Category(
            name: "Fruits",
            items: [
                Item(displayName: "Apple", image: "apple"),
                Item(displayName: "Banana", image: "banana"),
                Item(displayName: "Orange", image: "orange"),
                Item(displayName: "Grapes", image: "grapes"),
                Item(displayName: "Mango", image: "mango"),
                Item(displayName: "Pineapple", image: "pineapple"),
                Item(displayName: "Strawberry", image: "strawberry"),
                Item(displayName: "Blueberry", image: "blueberry"),
                Item(displayName: "Peach", image: "peach"),
                Item(displayName: "Apple1", image: "apple"),
                Item(displayName: "Banana1", image: "banana"),
                Item(displayName: "Orange1", image: "orange"),
                Item(displayName: "Grapes1", image: "grapes"),
                Item(displayName: "Mango1", image: "mango"),
                Item(displayName: "Pineapple1", image: "pineapple"),
                Item(displayName: "Strawberry1", image: "strawberry"),
                Item(displayName: "Blueberry1", image: "blueberry"),
                Item(displayName: "Peach1", image: "peach")
            ]
        ),
        Category(
            name: "Vegetables",
            items: [
                Item(displayName: "Broccoli", image: "broccoli"),
                Item(displayName: "Cauliflower", image: "cauliflower"),
                Item(displayName: "Bell Pepper", image: "bellpepper"),
                Item(displayName: "Carrot", image: "carrot"),
                Item(displayName: "Cabbage", image: "cabbage"),
                Item(displayName: "Cucumber", image: "cucumber"),
                Item(displayName: "Spinach", image: "spinach"),
                Item(displayName: "Tomato", image: "tomato"),
                Item(displayName: "Garlic", image: "garlic"),
                Item(displayName: "Broccoli1", image: "broccoli"),
                Item(displayName: "Cauliflower1", image: "cauliflower"),
                Item(displayName: "Bell Pepper1", image: "bellpepper"),
                Item(displayName: "Carrot1", image: "carrot"),
                Item(displayName: "Cabbage1", image: "cabbage"),
                Item(displayName: "Cucumber1", image: "cucumber"),
                Item(displayName: "Spinach1", image: "spinach"),
                Item(displayName: "Tomato1", image: "tomato"),
                Item(displayName: "Garlic1", image: "garlic")
            ]
        ),
        Category(
            name: "Middle Eastern Dishes",
            items: [
                Item(displayName: "Manousheh", image: "manousheh"),
                Item(displayName: "Iranian Sangak", image: "iraniansangak"),
                Item(displayName: "Chelo Kebab", image: "chelokebab"),
                Item(displayName: "Al Harees", image: "alharees"),
                Item(displayName: "Al Machboos", image: "almachboos"),
                Item(displayName: "Mandi", image: "mandi"),
                Item(displayName: "Oozie", image: "oozie"),
                Item(displayName: "Tabbouleh", image: "tabbouleh"),
                Item(displayName: "Kousa Mahshi", image: "kousamahshi"),
                Item(displayName: "Manousheh1", image: "manousheh"),
                Item(displayName: "Iranian Sangak1", image: "iraniansangak"),
                Item(displayName: "Chelo Kebab1", image: "chelokebab"),
                Item(displayName: "Al Harees1", image: "alharees"),
                Item(displayName: "Al Machboos1", image: "almachboos"),
                Item(displayName: "Mandi1", image: "mandi"),
                Item(displayName: "Oozie1", image: "oozie"),
                Item(displayName: "Tabbouleh1", image: "tabbouleh"),
                Item(displayName: "Kousa Mahshi1", image: "kousamahshi")
            ]
        )
    ]
)

