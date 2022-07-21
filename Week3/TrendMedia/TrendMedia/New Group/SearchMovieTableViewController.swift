//
//  SearchMovieTableViewController.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/20.
//

import UIKit

class SearchMovieTableViewController: UITableViewController {

    // 무비 인포는 초기화할 필요가없음(이미 데이터가 존재해서)
    var movieList = MovieInfo()
//    ["암살", "괴물", "해리포터와 해리포터 해리포터", "내 머리속의 지우개", "기묘한 이야기", "라라랜드", "라이언 일병 구하기", "외계+인"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieTableViewCell", for: indexPath) as! SearchMovieTableViewCell
        
        // let data = MovieInfo().movie[indexPath.row]는 인스턴스를 계쏙 해줘야해서
        // 상수로 선언해주고 사용
        let data = movieList.movie[indexPath.row]
        cell.configureCell(data: data)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 디바이스 전체의 높이에서 1/8을 가지겠다!는 의미
        return UIScreen.main.bounds.height / 8
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didSelectRowAt")
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RecommendCollectionViewController") as! Recommend1CollectionViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
