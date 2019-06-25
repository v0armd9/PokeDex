//
//  Pokemon.swift
//  PokeDex
//
//  Created by Darin Marcus Armstrong on 6/25/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    
    let name : String
    let id: Int
    let abilities: [AbilityDict]
    let sprites: SpriteDict
}

struct AbilityDict: Decodable {
    let ability: Ability


    struct Ability: Decodable {
        let name: String
    }
}

struct SpriteDict: Decodable {
    let image: URL
    
    private enum CodingKeys: String, CodingKey {
        case image = "front_shiny"
    }
}
