//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/18.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case total, personal, others // 섹션(0 , 1, 2)
    
    var sectionTitle: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    
    var rowTitle: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "멀티프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}


class SettingTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].sectionTitle
    }
    
    // 섹션의 개수 나타내주는 함수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count // 배열이 되는 것
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases[section].rowTitle.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting")!
        // indexPath : 셀은 각각의 섹션내에서 인덱스값이 0,1,2 셀은 0,1,2,3으로 시작됨 >> (0,1), (2, 3)으로 이루어짐
        // 때문에 indexPath.row, indexPath.section을 전달받는다. >> 인덱싱을 활용해 값 설정 가능해진다.
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].rowTitle[indexPath.row]
        return cell
    }
}
