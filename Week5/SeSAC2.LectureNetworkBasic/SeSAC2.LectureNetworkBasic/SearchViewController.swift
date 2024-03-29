
//
//  SearchViewController.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/07/27.
//

import UIKit

import Alamofire
import SwiftyJSON
import JGProgressHUD

/*
 Swift Protocol
 - Delegatee
 - DataSource
 
 1. 왼팔/오른팔 가져오기
 2. 테이블 뷰 아웃렛 연결
 3. 1 + 2
 */

/*
 
 각 json value -> list -> 테이블 뷰 갱신
 서버의 응답이 몇 개인지 모를 경우엔 >> 반복되는 것이 겁나 많아진다.
 
 */


class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var second: UITableView!
    
    // BoxOffice 배열
    var list: [BoxOfficeModel] = []
    
    // ProgfessView
    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 연결고리작업 : 테이블 뷰가 해야할 역할 > 뷰 컨트롤러에게 요청
        
        searchTableView.delegate = self  // 클래스의 인스턴스 자체를 의미
        searchTableView.dataSource = self
        
        // 테이블뷰가 사용할 테이블뷰 셀(XIB) 등록
        // XIB: xml interface builder  <= NIB
        searchTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: ListTableViewCell.identifier)
        
        searchBar.delegate = self
        
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd" // TMI -> "yyyyMMdd" "YYYYMMdd" (찾아보기)
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        let dateResult = format.string(from: yesterday!)
        
        // 네트워크 통신 : 서버 점검 등에 의한 예외 처리
        // 네트워크가 느린 환경 테스트
        // 실기기 테스트 시 Condition 조절 가능( 권장 O )
        // 시뮬레이터에서도 가능 (But 권장 X)
        
        requestBoxOffice(text: dateResult)
    }
    
    func configureView() {
        searchTableView.backgroundColor = .clear
        searchTableView.separatorColor = .clear
        searchTableView.rowHeight = 60
    }
    
    func configureLabel() {
        
    }
    
    func requestBoxOffice(text: String) {
        
        hud.show(in: view)
        self.list.removeAll() // 지우고 나서 서버통신 시작
        
        let url = "\(EndPoint.boxOfficeURL)key=\(APIKey.BOXOFFICE)&targetDt=\(text)"
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                // self.list.removeAll() >> 서버 통신성공하면 배열 비워주기
                
                for movie in json["boxOfficeResult"]["dailyBoxOfficeList"].arrayValue {
                    let movieNm = movie["movieNm"].stringValue
                    let openDt = movie["openDt"].stringValue
                    let audiAcc = movie["audiAcc"].stringValue
                    
                    let data = BoxOfficeModel(movieTitle: movieNm, releaseDate: openDt, totalCount: audiAcc)
                    
                    self.list.append(data)
                }
                
                
                
                self.searchTableView.reloadData()
                self.hud.dismiss()
                
            case .failure(let error):
                print(error)
                self.hud.dismiss()
                
                // 시뮬레이터 실패 테스트 > 맥
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        
    
        cell.backgroundColor = .clear
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.text = "\(list[indexPath.row].movieTitle): \(list[indexPath.row].releaseDate)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        requestBoxOffice(text: searchBar.text!)
    }
}
