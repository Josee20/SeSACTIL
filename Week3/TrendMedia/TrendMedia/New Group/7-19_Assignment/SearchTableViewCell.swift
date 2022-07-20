//
//  SearchTableViewCell.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/20.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieSummary: UILabel!
    
    func configurationCell(data: HarryPotter) {
        moviePosterImage.image = data.poster
        movieTitle.text = data.title
        movieReleaseDate.text = data.releaseDate
        movieSummary.text = data.overview
        
    }
    
}
