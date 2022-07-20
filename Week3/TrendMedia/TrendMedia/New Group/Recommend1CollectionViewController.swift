//
//  Recommend1CollectionViewController.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/20.
//

import UIKit
import Toast
import Kingfisher

/*
 TableView > CollectionView
 Row > Item
 heightForRowAt > ??? FlowLayout (heightForItem이 없는 이유)
 */

var imageURL = "https://image.kmib.co.kr/online_image/2021/1121/2021111914060015124_1637298360_0016487163.jpg"
class Recommend1CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 화면에 보여지기전에 컬렉션뷰의 셀 크기, 셀 사이 간격 등을 설정해주어야함(보통 비율로 많이 잡기 때문에)
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8 // spacing을 일괄적으로 처리할 수 있다.(보통 같은간격이기 때문에)
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing //CGFloat(spacing) // 하나하나 해줘야하가 때문에 귀찮으므로 상수에서 아예 타입명시해줌
        layout.minimumInteritemSpacing = spacing
        
        // 설정된 레이아웃을 사용할거야!라는 의미
        collectionView.collectionViewLayout = layout

    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as! RecommendCollectionViewCell
        
        cell.posterImage.backgroundColor = .orange
        
        let url = URL(string: imageURL)
        cell.posterImage.kf.setImage(with: url)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다.", duration: 3, position: .center)
        
    }
    
}
