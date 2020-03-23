//
//  MovieCell.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 21/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import UIKit
import Foundation

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    static let identifier = "MovieCell"
    static let rowHeight: CGFloat = 100

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with movie: Movie){
        self.titleLabel.text = movie.title
        self.directorLabel.text = movie.director
        self.dateLabel.text = movie.releaseDate
    }
    
}
