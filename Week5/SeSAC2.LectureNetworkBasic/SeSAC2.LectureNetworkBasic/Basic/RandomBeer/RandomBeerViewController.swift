//
//  RandomBeerViewController.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/08/01.
//

import UIKit

import Alamofire
import Kingfisher
import SwiftyJSON

class RandomBeerViewController: UIViewController {

    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    @IBOutlet weak var recommendBeerButton: UIButton!
    @IBOutlet weak var beerImageImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    func requestRecommendBeer() {
        let url = "https://api.punkapi.com/v2/beers/random"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print("JSON: \(json)")
                
                let name = json[0]["name"].stringValue
                self.beerNameLabel.text = name
                print(name)

                let description = json[0]["description"].stringValue
                self.beerDescriptionLabel.text = description
                print(description)

                let imageURL = json[0]["image_url"].stringValue
                let url = URL(string: imageURL)
                
                self.beerImageImageView.kf.setImage(with: url)
                //self.beerImageImageView.image = king
                print(imageURL)
                
            case .failure(let error):
                print(error)
            }
        }
    }

    @IBAction func recommendBeerButtonClicked(_ sender: Any) {
        
        requestRecommendBeer()
        
    }
}


