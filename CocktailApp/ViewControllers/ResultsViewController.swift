//
//  ResultsViewController.swift
//  CocktailApp
//
//  Created by Leysan Latypova on 06.02.2022.
//

import UIKit

class ResultsViewController: UITableViewController {

    var drinks: [Drink] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! DrinkCell
        let drink = drinks[indexPath.row]
        cell.configure(with: drink)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let drinkDescriptionVC = segue.destination as? DrinkDescriptionViewController else { return}
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let drink = drinks[indexPath.row]
        drinkDescriptionVC.drink = drink
    }
}


