//
//  MoviesViewModel.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 22/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import Foundation

class MoviesViewModel {
    
    fileprivate var movies: [Movie]
    
    init(){
        movies = []
    }
    
    func retrieveMovies() {
        let service = NetworkManager()
        service.getAllFilms()
        service.completionHandler { (movies, status, message) in
            if status {
                guard let _movies = movies else {return}
                self.movies = _movies.sorted(by: { $0.episodeNumber! < $1.episodeNumber! })
            }
        }
    }
    
    func movieCount() -> Int {
        return movies.count
    }
    
    func getMovie(at position: Int) -> Movie {
        return movies[position]
    }
    
}
