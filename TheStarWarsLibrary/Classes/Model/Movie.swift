//
//  Movie.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 21/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import Foundation

struct AllMovies: Decodable {
    var movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable {
    var title: String?
    var director: String?
    var releaseDate: String?
    var charactersURLs: [String]?
    var episodeNumber: Int?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case director = "director"
        case releaseDate = "release_date"
        case charactersURLs = "characters"
        case episodeNumber = "episode_id"
    }
    
}
