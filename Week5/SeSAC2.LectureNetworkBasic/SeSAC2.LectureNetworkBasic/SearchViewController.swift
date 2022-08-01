
//
//  SearchViewController.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/07/27.
//

import UIKit

/*
 Swift Protocol
 - Delegatee
 - DataSource
 
 1. 왼팔/오른팔 가져오기
 2. 테이블 뷰 아웃렛 연결
 3. 1 + 2
 */

//extension UIViewController {
//    func setBackgroundColor() {
//        view.backgroundCOlor = .red
//    }
//}


//class SearchViewController: UIViewController, ViewPresentableProtocol, UITableViewDelegate, UITableViewDataSource {
//    
//    
//
//    
//
//    @IBOutlet weak var searchTableView: UITableView!
//    @IBOutlet weak var second: UITableView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        
//        // 연결고리작업 : 테이블 뷰가 해야할 역할 > 뷰 컨트롤러에게 요청
//        
//        searchTableView.delegate = self  // 클래스의 인스턴스 자체를 의미
//        searchTableView.dataSource = self
//        
//        // 테이블뷰가 사용할 테이블뷰 셀(XIB) 등록
//        // XIB: xml interface builder  <= NIB
//        searchTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: ListTableViewCell.identifier)
//        
//    }
//    
//    func configureView() {
//        searchTableView.backgroundColor = .clear
//        searchTableView.separatorColor = .clear
//        searchTableView.rowHeight = 60
//    }
//    
//    func configureLabel() {
//        
//    }
//    
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else {
//            return UITableViewCell()
//        }
//        
//        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
//        cell.titleLabel.text = "HELLO"
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//}
