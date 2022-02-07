//
//  Drink.swift
//  CocktailApp
//
//  Created by Leysan Latypova on 06.02.2022.
//

struct Drink: Decodable {
    
    let strDrink: String
    let strAlcoholic: String
    let strInstructions: String
    let strDrinkThumb: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
}

struct DrinksResponse: Decodable {
    let drinks: [Drink]
}
