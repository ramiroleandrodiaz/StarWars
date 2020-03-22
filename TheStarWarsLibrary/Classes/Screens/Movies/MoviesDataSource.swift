//
//  MoviesDataSource.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 22/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import Foundation
import UIKit

protocol DataSourceObserver: NSObject {
    func dataSourceUpdated()
    func dataSourceFailed()
}

class MovieDataSource : NSObject{
    
    weak var observer: DataSourceObserver?
    var movies: [Movie]
    
    init(observer: DataSourceObserver){
        self.observer = observer
        self.movies = []
        
        super.init()
        
        loadMovies()
    }
    
    func loadMovies() {
        let service = NetworkManager()
        service.getAllFilms()
        service.completionHandler { (movies, status, message) in
            if status {
                //guard let self = self else {return}
                guard let _movies = movies else {return}
                self.movies = _movies.sorted(by: { $0.episodeNumber! < $1.episodeNumber! })
                self.observer?.dataSourceUpdated()
            }
        }
    }
}

extension MovieDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(movies[indexPath.row].title!)
    }
    

}
