//
//  BeerCollectionViewController.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/08/02.
//

import UIKit

import Alamofire
import Kingfisher
import SwiftyJSON

class BeerCollectionViewController: UICollectionViewController {

    var beerList: [BeerInfo] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()

        requestBeerInfo()
    }
    
    func requestBeerInfo() {
        let url = "https://api.punkapi.com/v2/beers"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print("JSON: \(json)")
                
                
                for beer in json.arrayValue {
                    let beerNm = beer["name"].stringValue
                    let beerImageURL = beer["image_url"].stringValue
                    let beerDescription = beer["description"].stringValue
                    
                    let url = URL(string: beerImageURL)!
                    
                    let data = BeerInfo(title: beerNm, image: url, description: beerDescription)
                    
                    self.beerList.append(data)
                }
                
                print(self.beerList)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setLayout() {
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 8
        let width = UIScreen.main.bounds.width - (space * 3)
        
        layout.itemSize = CGSize.init(width: width / 2, height: width * 2/3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeerCollectionViewCell.identifier, for: indexPath) as! BeerCollectionViewCell
        
        cell.collecdtionBeerNameLabel.text = beerList[indexPath.row].title
        cell.collectionBeerImageView.kf.setImage(with: beerList[indexPath.row].image)
        cell.collectionBeerDescriptionLabel.text = beerList[indexPath.row].description
        
        cell.backgroundColor = .systemGray5
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beerList.count
    }

}
