//
//  NetworkManager.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 21/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import Foundation
import Alamofire

class MoviesAPI {
    
    fileprivate var baseUrl: String = ""
    typealias moviesCallBack = (_ movies:[Movie]?,_ status:Bool,_ message:String) -> Void
    var callBack: moviesCallBack?
    
    init() {
        self.baseUrl = "https://swapi.co/api/"
    }
    
    //MARK :- getAllFilms
    func getAllFilms() {
        AF.request(baseUrl + "films", method: .get, parameters: nil,
            encoding: URLEncoding.default, headers: nil,
            interceptor: nil).response { (responseData) in
                guard let data = responseData.data else {
                    self.callBack?(nil, false, "")
                    return
                }
                do {
                    let movies = try JSONDecoder().decode(AllMovies.self, from: data)
                    self.callBack?(movies.movies, true, "")
                } catch {
                    print("Error decoding movies == \(error)")
                    self.callBack?(nil, false, error.localizedDescription)
                }
        }
    }
    
    func completionHandler(callBack: @escaping moviesCallBack) {
        self.callBack = callBack
    }
}
