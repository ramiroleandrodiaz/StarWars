//
//  PeopleDataSource.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 22/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import Foundation
import UIKit

class PeopleDataSource : NSObject{
    weak var observer: DataSourceObserver?
    var people: [MovieCharacter]
    var movie: Movie
    
    init(observer: DataSourceObserver, movie: Movie){
        self.observer = observer
        self.people = []
        self.movie = movie
        
        super.init()
        
        loadPeople()
    }
    
    func loadPeople() {
        let service = PeopleAPI()
        for characterURL in movie.charactersURLs {
            service.getMovieCharacter(characterURL.getMovieCharacterNumber())
            service.completionHandler { (character, status, message) in
                if status {
                    guard let _character = character else {return}
                    self.people.append(_character)
                    self.observer?.dataSourceUpdated()
                }
            }
        }
    }
}

extension PeopleDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PeopleCell.identifier, for: indexPath) as! PeopleCell
        let character = people[indexPath.row]
        cell.configure(with: character)
        return cell
    }
}
