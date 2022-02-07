//
//  DrinkDescriptionViewController.swift
//  CocktailApp
//
//  Created by Leysan Latypova on 06.02.2022.
//

import UIKit

class DrinkDescriptionViewController: UITableViewController {
    
    var drink: Drink!
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = Bundle.main.loadNibNamed("DrinkImageCell", owner: self, options: nil)?[0] as! DrinkImageCell
            DispatchQueue.global().async {
                if let url = URL(string: self.drink.strDrinkThumb),
                   let imageData = try? Data(contentsOf: url)  {
                    DispatchQueue.main.async {
                        cell.cocktailImageView.image = UIImage(data: imageData)
                    }
                }
            }
            return cell
        } else {
            
            let cell = UITableViewCell()
            var content = cell.defaultContentConfiguration()
            content.text = """
            Title: \(drink.strDrink)
            Is alcoholic: \(drink.strAlcoholic)
            Ingredients:
            \(drink.strIngredient1 ?? "")
            \(drink.strIngredient2 ?? "")
            \(drink.strIngredient3 ?? "")
            \(drink.strIngredient4 ?? "")
            \(drink.strIngredient5 ?? "")
            Instructions:
            \(drink.strInstructions)
            """
            
            cell.contentConfiguration = content
            return cell
        }
    }
}
