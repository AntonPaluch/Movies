//
//  NetworkManager.swift
//  Movies
//
//  Created by Pandos on 20.02.2022.
//

import Foundation

class NetworkManager {
    
   static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with comletion: @escaping (Content) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            
            do {
                let movies = try JSONDecoder().decode(Content.self, from: data)
                DispatchQueue.main.async {
                    comletion(movies)
                }
            } catch let error {
                print(error)
            }
        } .resume()
    }
    
}
