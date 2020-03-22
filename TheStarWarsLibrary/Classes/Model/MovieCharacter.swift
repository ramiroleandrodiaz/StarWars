//
//  Character.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 21/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import Foundation

struct MovieCharacter: Decodable {
    var name: String?
    var gender: String?
    var birthYear: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case gender = "gender"
        case birthYear = "birth_year"
    }
}
