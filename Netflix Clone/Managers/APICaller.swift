//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Tunay Toksöz on 29.10.2022.
//

import Foundation

struct Constants {
    static let API_KEY = "66fbd6d78d9b530d9c42ad8c52cb098b"
    static let baseURL = "https://api.themoviedb.org"
}

enum ApiError : Error {
    case failedToGetData
}
class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Movie],Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                print(results.results[0].originalTitle)
            } catch{
                print(error.localizedDescription)
            }
        }
        
        task.resume()
                
    }
}
