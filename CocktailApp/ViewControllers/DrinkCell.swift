//
//  DrinkCell.swift
//  CocktailApp
//
//  Created by Leysan Latypova on 06.02.2022.
//

import UIKit

class DrinkCell: UITableViewCell {
    @IBOutlet var cocktailImage: UIImageView!
    @IBOutlet var cocktailNameLabel: UILabel!
    
    func configure(with drink: Drink) {
        cocktailNameLabel.text = drink.strDrink
        DispatchQueue.global().async {
            guard let url = URL(string: drink.strDrinkThumb) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.cocktailImage.image = UIImage(data: imageData)
            }
        }
    }
}
