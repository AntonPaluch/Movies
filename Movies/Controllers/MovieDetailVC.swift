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

    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var nameMovieLabel: UILabel!
    @IBOutlet weak var dataOfMovie: UILabel!
    @IBOutlet weak var languageMovie: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bgBlurPhoto: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startIndicator()
        blurImage()
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
                  self.activityIndicator.stopAnimating()
              }
          }
        }
      }
    
    func updateUI() {
        imageViewMovie?.image = image
        view.bgBlurImage(with: imageViewMovie.image, bv: bgBlurPhoto)
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

extension MovieDetailVC {

    func startIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func blurImage() {
         bgBlurPhoto.clipsToBounds = true
         bgBlurPhoto.layer.cornerRadius = 15
    }
}
