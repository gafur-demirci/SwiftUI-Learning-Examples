//
//  JokesViewModel.swift
//  jokes
//
//  Created by Abdulgafur Demirci on 2.04.2025.
//

import Foundation
import Alamofire

class JokesViewModel: ObservableObject {
    @Published var jokes: [Joke] = []
    
    init() {
        fetchJokes()
    }
    
    func fetchJokes() {
        AF.request("https://api.chucknorris.io/jokes/random", method: .get).responseDecodable(of:Joke.self) { response in
            switch response.result {
                case .success(let joke):
                    self.jokes += [joke]
                case .failure(let error):
                    print("Failed with error: \(error)")
            }
        }
    }
}
