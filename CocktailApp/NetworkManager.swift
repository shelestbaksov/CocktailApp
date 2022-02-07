//
//  NetworkManager.swift
//  CocktailApp
//
//  Created by Leysan Latypova on 06.02.2022.
//

import Foundation

struct DrinkSearchError: Error { }

final class NetworkManager {
    
    func searchDrinkRecepies(searchTerm: String, completion: @escaping (Result<[Drink], Error>) -> ()) {
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(searchTerm)") else {  completion(.failure(DrinkSearchError()))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(DrinkSearchError()))
                return
            }
            do {
                let drinksReponse = try JSONDecoder().decode(DrinksResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(drinksReponse.drinks))
                }
            } catch let error {
                completion(.failure(error))
            }
        }.resume()

    }
}
