//
//  ViewController.swift
//  Movies
//
//  Created by Pandos on 18.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let content: [Content] = []
    
    let url = "https://www.signalmediacorp.com/api/main_page"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func fetchFilms() {
        guard let url = URL(string: URLConstants.apiMovies) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _ ) in
//            if let error = error {
//                print(error)
//                return
//            }
//            if let responce = responce {
//                print(responce)
//            }
            guard let data = data else { return }
            do {
                let movies = try JSONDecoder().decode(Content.self, from: data)
                print(movies)
            } catch let error {
                print(error)
            }

        } .resume()
        
        
    }
}

