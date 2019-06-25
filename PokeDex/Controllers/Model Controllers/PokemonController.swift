//
//  PokemonController.swift
//  PokeDex
//
//  Created by Darin Marcus Armstrong on 6/25/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation

class PokemonController{
    
    static let sharedInstance = PokemonController()
    
    func fetchPokemonWith(searchTerm: String, completion: @escaping(Pokemon?) -> Void) {
        
        //Build Base URL
        let baseURL = URL(string: "https://pokeapi.co/api/v2")
        //Add Pokemon Path Component
        let pokemonPathComponentURL = baseURL?.appendingPathComponent("pokemon")
        //Add search term
        guard let finalURL = pokemonPathComponentURL?.appendingPathComponent(searchTerm) else {return}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            }
            if let data = data {
                do {
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    completion(pokemon)
                } catch {
                    print("Error Fetching Pokemon!")
                    completion(nil);return
                }
            }
        }.resume()
    }
}
