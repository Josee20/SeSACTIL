//
//  BeerCollectionViewCell.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/08/02.
//

import UIKit

class BeerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BeerCollectionViewCell"
    
    @IBOutlet weak var collecdtionBeerNameLabel: UILabel!
    @IBOutlet weak var collectionBeerImageView: UIImageView!
    @IBOutlet weak var collectionBeerDescriptionLabel: UILabel!
    
}
