//
//  LibraryCollectionViewCell.swift
//  LibraryProject
//
//  Created by 이동기 on 2022/07/20.
//

import UIKit

class LibraryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRateLabel: UILabel!
    
    func configuration(data: Movie) {
        posterImageView.image = data.posterImage
        movieTitleLabel.text = data.title
        movieRateLabel.text = "\(data.rate)"
    }
}
