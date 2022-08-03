//
//  ImageSearchViewController.swift
//  SeSAC2.LectureNetworkBasic

//  Created by 이동기 on 2022/08/03.
//

import UIKit

import Alamofire
import Kingfisher
import SwiftyJSON

class ImageSearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var imageList: [URL] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fetchImage()
        setLayout()
    }
    
    func setLayout() {
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 12
        let width = UIScreen.main.bounds.width - (space * 3)
        
        layout.itemSize = CGSize.init(width: width / 2, height: width * 2/3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space

        collectionView.collectionViewLayout = layout
    }
    
    
    // fetchImage, requestImage, callRequestImage, getImage...(네트워크 호출할 때) -> response에 따라 네이밍 설정해주기도함
    func fetchImage() {
        
        
        // 과자를 UTF-8 인코딩 형태(%형태로 바꿔줌)
        let text = "과자".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = EndPoint.imageSearchURL + "query=\(text)&display=30&start=1"
        
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for image in json["items"].arrayValue {
                    let searchImage = image["thumbnail"].stringValue
                    let url = URL(string: searchImage)!
                    
                    self.imageList.append(url)
                }
                
                self.collectionView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSearchCollectionViewCell.identifier, for: indexPath) as? ImageSearchCollectionViewCell else {
            return ImageSearchCollectionViewCell()
        }
        
        cell.searchImageView.kf.setImage(with: imageList[indexPath.row])
        cell.backgroundColor = .systemGray6
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
}
