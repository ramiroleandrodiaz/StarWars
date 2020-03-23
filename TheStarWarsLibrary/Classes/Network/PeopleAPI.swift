//
//  NetworkManager.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 21/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import Foundation
import Alamofire

class PeopleAPI {
    
    fileprivate var baseUrl: String = ""
    typealias peopleCallBack = (_ character:MovieCharacter?,_ status:Bool,_ message:String) -> Void
    var callBack: peopleCallBack?
    
    init() {
        self.baseUrl = "https://swapi.co/api/"
    }
    
    //MARK :- getCharacter
    func getMovieCharacter(_ movieCharacterNumber: Int) {
        AF.request(baseUrl + "people/\(movieCharacterNumber)" , method: .get, parameters: nil,
            encoding: URLEncoding.default, headers: nil,
            interceptor: nil).response { (responseData) in
                guard let data = responseData.data else {
                    self.callBack?(nil, false, "")
                    return
                }
                do {
                    let people = try JSONDecoder().decode(MovieCharacter.self, from: data)
                    self.callBack?(people, true, "")
                } catch {
                    print("Error decoding people == \(error)")
                    self.callBack?(nil, false, error.localizedDescription)
                }
        }
    }
    
    func completionHandler(callBack: @escaping peopleCallBack) {
        self.callBack = callBack
    }
}
