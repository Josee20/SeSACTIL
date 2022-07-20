//
//  LibraryCollectionViewController.swift
//  LibraryProject
//
//  Created by 이동기 on 2022/07/20.
//

import UIKit
import Toast

var movieList = MovieInfo()
var colorSet: [UIColor] = [.cyan, .systemTeal, .blue, .darkGray, .purple, .brown, .green]

class LibraryCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 8
        let width = UIScreen.main.bounds.width - (space * 3)
        
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        
    
        collectionView.collectionViewLayout = layout
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCollectionViewCell", for: indexPath) as! LibraryCollectionViewCell
        
        let data = movieList.movie[indexPath.row]
        cell.configuration(data: data)
        
        cell.backgroundColor = colorSet.randomElement()
        cell.layer.cornerRadius = 20
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.makeToast("\(indexPath.item + 1)번째 포스터입니다", duration: 3.0, position: .center)
    }
}
