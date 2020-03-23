//
//  String+Utils.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 22/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import Foundation

extension String {
    
    func getMovieCharacterNumber() -> Int{
        // Removing the Last "/"
        var shortenedString = self.prefix(self.count - 1)
        if let index = shortenedString.lastIndex(of: "/") {
            // After last remaining "/" only movie characterNumberRemains
            shortenedString = shortenedString.suffix(from: index)
            shortenedString = shortenedString.suffix(shortenedString.count-1)
        }
        return Int(String(shortenedString)) ?? 0
    }
}
