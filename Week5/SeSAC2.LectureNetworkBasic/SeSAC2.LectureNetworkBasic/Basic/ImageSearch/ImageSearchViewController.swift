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
    
    // 네트워크 요청할 시작 페이지 넘버
    var startPage = 1
    var totalCount = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        
        setLayout()
        fetchImage(query: "고래밥")
        
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
//    func fetchImage(query: String) {
//
//        // 과자를 UTF-8 인코딩 형태(%형태로 바꿔줌)
//        let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//        let url = EndPoint.imageSearchURL + "query=\(text)&display=30&start=\(startPage)"
//
//        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
//
//        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                print("JSON: \(json)")
//
//                self.totalCount = json["total"].intValue
//
////                for image in json["items"].arrayValue {
////                    let searchImage = image["thumbnail"].stringValue
////                    let url = URL(string: searchImage)!
////
////                    self.imageList.append(url)
////                }
//
//
//                let imageList = json["items"].arrayValue.map {
//                    URL(string: $0["thumbnail"].stringValue)!
//                }
//
//
//                self.imageList.append(contentsOf: imageList)
//
//
//                self.collectionView.reloadData()
//
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    func fetchImage(query: String) {
        ImageSearchAPIManager.shared.fetchImage(query: query, startPage: startPage) { totalCount, imageList in
            self.totalCount = totalCount
            self.imageList.append(contentsOf: imageList)
            self.collectionView.reloadData()
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
    
    // 1. 페이지네이션 방법1. 컬렉션 뷰가 특정 셀을 그리려는 시점에 호출되는 메소드.
    // 마지막 셀에 사용자가 위치했는지 명확하게 확인이 어려움(권장 X)
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
//    // 페이지네이션 방법2. UIScrollViewDelegateProtocol
//    // 테이블뷰, 컬렉션뷰는 스크롤뷰를 상속받고 있어서, 스크롤뷰 프로토콜을 사용할 수 있다.
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset)
//    }
}

// 페이지네이션 방법3
// 용량이 큰 이미지를 다운받아 셀에 보여주려고 하는 경우에 효과적.
// 셀이 화면에 보이기 전에 미리 필요한 리소스를 다운받을 수도 있고, 필요하지 않다면 데이터를 취소할 수도 있음
// iOS10 +, 스크롤 성능 상향됨
extension ImageSearchViewController: UICollectionViewDataSourcePrefetching {
    
    // 셀이 화면에 보이기 직전에 필요한 리소스를 미리 다운 받는 기능
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            if imageList.count - 1 == indexPath.item && imageList.count < totalCount {
                startPage += 30
                fetchImage(query: searchBar.text!)
            }
        }
        // 156개 까지 자료수가 있다면 156개 때 데이터가 안나오도록 처리해줘야함! 아니면 같은사진이 계속 반복됨.
        
        print("======\(indexPaths)")
    }
    
    // 작업취소 - 사용자가 스크롤을 엄청 빨리하는 경우
    // 직접 취소한느 기능을 구현해야함
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        print("======취소: \(indexPaths)")
    }
    
}

extension ImageSearchViewController: UISearchBarDelegate {
    
    // 검색 버튼 클릭시 실행, 검색 단어가 바뀔수 있음
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            imageList.removeAll()
            startPage = 1
            
            collectionView.scrollsToTop
            
            fetchImage(query: text)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        imageList.removeAll()
        collectionView.reloadData()
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
}
