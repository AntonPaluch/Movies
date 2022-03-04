//
//  CollectionViewCell.swift
//  Movies
//
//  Created by Pandos on 01.03.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageMovies: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var labelMovies: UILabel!
    @IBOutlet weak var blurCell: UIVisualEffectView!

    func configure(with movie: Films ) {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        bgBlurImage(with: imageMovies.image, bv: blurCell)
        labelMovies.text = movie.title
        let coverId = Int(movie.cover.id) ?? UUID().hashValue
        imageMovies.tag = coverId
        guard let imageUrl = movie.cover.imageURL else {return}
                if self.imageMovies.tag == coverId {
                ImageManager.shared.fetchImage(url: imageUrl) { image in
                self.imageMovies.image = image
                self.activityIndicator.isHidden = true
                }
            }
    }
}
