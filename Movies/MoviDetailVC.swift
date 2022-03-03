//
//  ViewController.swift
//  Movies
//
//  Created by Pandos on 03.03.2022.
//

import UIKit

class MoviDetailVC: UIViewController {
    
    private var movie: Films?
    private var image: UIImage?

    @IBOutlet weak var imageViewMove: UIImageView!
    @IBOutlet weak var nameMoveLabel: UILabel!
    @IBOutlet weak var dataOfMove: UILabel!
    @IBOutlet weak var languageMove: UILabel!
    
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
        nameMoveLabel?.text = movie.title
        dataOfMove?.text = movie.created_at
        languageMove?.text = movie.languages.map({$0.title}).joined(separator: ", ")
        } else {
            nameMoveLabel?.text = nil
            dataOfMove?.text = nil
            languageMove?.text = nil
        }
    }

}
