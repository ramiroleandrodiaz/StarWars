//
//  MovieCell.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 21/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import UIKit
import Foundation

class PeopleCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    
    static let identifier = "PeopleCell"
    static let rowHeight: CGFloat = 100

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with movieCharacter: MovieCharacter){
        self.nameLabel.text = movieCharacter.name
        self.genderLabel.text = movieCharacter.gender
        self.birthLabel.text = movieCharacter.birthYear
    }
    
}
