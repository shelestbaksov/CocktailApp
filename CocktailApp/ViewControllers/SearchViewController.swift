//
//  ViewController.swift
//  CocktailApp
//
//  Created by Leysan Latypova on 06.02.2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    
    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func goButtonPressed() {
        if let searchTerm = searchBar.text, !searchTerm.isEmpty {
            networkManager.searchDrinkRecepies(searchTerm: searchTerm) { [weak self] result in
                switch result {
                case let .success(drinks):
                    self?.performSegue(withIdentifier: "showResults", sender: drinks)
                case .failure(_):
                    break
                }
            }
            
        } else {
            showAlert(
                title: "Attention",
                message: "Search field is empty",
                onOkTap: nil
            )
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? ResultsViewController, let drinks = sender as? [Drink]  {
            resultVC.drinks = drinks
        }
        
    }
}

extension SearchViewController {
    private func showAlert(
        title: String,
        message: String,
        onOkTap: ((UIAlertAction) -> ())? = nil)
    {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: onOkTap)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}



