//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/18.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var birthdayFriends = ["뽀로로", "신데렐라", "올라프", "스노기", "모구리", "고래밥"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 델리게이트랑 데이터소스가 테이블뷰의 왼팔 오른팔이라고 보면된다.
        
        
        // 셀 높이 조정(default: 44)
        tableView.rowHeight = 44
        
        
    }
    
    // 섹션의 갯수(옵션)
    // 섹션의 갯수는 디폴트로 1이기 때문에 섹션이 하나만 필요한 경우 함수를 안 써줘도 된다!
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // 섹션의 타이틀
    // 섹션은 인덱스 기반으로 이뤄지기 떄문에 section : Int가 들어가는 것
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // 없어도 되기때문에 옵셔널타입
        
        if section == 0 {
            return "생일인 친구"
        } else if section == 1 {
            return "즐겨찾기"
        } else if section == 2 {
            return "친구 140명"
        } else {
            // 실행할 때 까지 섹션이 3개를 리턴하는지 모르기 때문에 반드시 조건 처리를 해주어야함
            return "섹션"
        }
    }
    
    // 푸터에 섹션 줌
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "푸터"
    }
    
    
    // 1. 셀의 갯수(필수) : numberOfRowsInSection
    // ex. 카톡 친구 100명 > 셀 100개, 3000명 >> 셀 3000개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 섹션마다 셀의 개수를 정해주기 위해서
        if section == 0 {
            return birthdayFriends.count
        } else if section == 1 {
            return 2
        } else if section == 2 {
            return 10
        } else {
            return 0
        }
    }
    
    // 2. 셀의 디자인과 데이터(필수) : cellForRowAt
    // ex. 카톡 이름, 프로필 사진, 상태 메시지 등
    // 재사용 메커니즘
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellforrowat", indexPath)
        
        
        
        if indexPath.section == 2 {
            
            // 재사용이 여기서 일어남
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell")!
            
            cell.textLabel?.text = "2번 인덱스 텍스트"
            cell.textLabel?.textColor = .systemMint
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
            cell.detailTextLabel?.text = "디테일 레이블"
            
            //indexPath.row % 2 == 0, 1
            
            if indexPath.row % 2 == 0 {
                cell.imageView?.image = UIImage(systemName: "star")
                cell.backgroundColor = .lightGray
            } else {
                cell.imageView?.image = UIImage(systemName: "star.fill")
                cell.backgroundColor = .white
            }
            
//            cell.imageView?.image = indexPath.row % 2 == 0 ? UIImage(systemName: "star") : UIImage(systemName: "star.fill")
//            cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .white
            
            return cell
        } else {
            
            // * 100
            // 어떤 셀을 쓸지 정해야하기 때문에 이름을 정해줌(identifier: 부여)
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
            
            if indexPath.section == 0 {
                cell.textLabel?.text = birthdayFriends[indexPath.row]
                cell.textLabel?.textColor = .systemMint
                cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            } else if indexPath.section == 1 {
                cell.textLabel?.text = "1번 인덱스 텍스트"
                cell.textLabel?.textColor = .systemPink
                cell.textLabel?.font = .boldSystemFont(ofSize: 25)
            }
            
            // 값을 정해주고 나서 반환해줘야 하기 때문
            return cell
        }
    }
    
    
    // 셀의 높이(옵션, 빈도 높은) (feat. tableView.rowHeight)
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}
