//
//  CollectionViewCell.swift
//  Movies
//
//  Created by Pandos on 01.03.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageMovies: UIImageView!
    @IBOutlet weak var labelMovies: UILabel!
    
    func configure(with movie: Films ) {
        labelMovies.text = movie.title
        let coverId = Int(movie.cover.id) ?? UUID().hashValue
        imageMovies.tag = coverId
        DispatchQueue.global(qos: .default).async {
          if let imageUrl = movie.cover.imageURL,
            let data = try? Data(contentsOf: imageUrl) {
            let image = UIImage(data: data)
              DispatchQueue.main.async {
                  if self.imageMovies.tag == coverId {
                  self.imageMovies.image = image
            }
          }
        }
      }
    }
}
