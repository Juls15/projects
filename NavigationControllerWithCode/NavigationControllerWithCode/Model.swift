//
//  Model.swift
//  NavigationControllerWithCode
//
//  Created by Yulya on 06.03.2023.
//

import Foundation

struct Drinks: Codable {
    let drinks: [Drink]?
}

struct Drink: Codable {
    let idDrink: String?
    let strDrink: String?
    let strDrinkThumb: String?
}

struct Ingridients: Codable {
    let ingredients: [Ingridient]?
}

struct Ingridient: Codable {
    let strIngredient: String?
    let strDescription: String?
}
