//
//  ViewController.swift
//  Movies
//
//  Created by Pandos on 03.03.2022.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    private var movie: Films?
    private var image: UIImage?

    @IBOutlet weak var imageViewMove: UIImageView!
    @IBOutlet weak var nameMovieLabel: UILabel!
    @IBOutlet weak var dataOfMovie: UILabel!
    @IBOutlet weak var languageMovie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func configure(with movie: Films) {
        self.movie = movie
        DispatchQueue.global(qos: .default).async {
          if let imageUrl = movie.cover.imageURL,
            let data = try? Data(contentsOf: imageUrl) {
            self.image = UIImage(data: data)
              DispatchQueue.main.async {
                  self.updateUI()
              }
          }
        }
      }
    
    func updateUI() {
        imageViewMove?.image = image
        if let movie = movie {
        nameMovieLabel?.text = movie.title
        dataOfMovie?.text = movie.created_at
        languageMovie?.text = movie.languages.map({$0.title}).joined(separator: ", ")
        } else {
            nameMovieLabel?.text = nil
            dataOfMovie?.text = nil
            languageMovie?.text = nil
        }
    }

}
