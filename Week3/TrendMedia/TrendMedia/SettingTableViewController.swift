//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/18.
//

import UIKit

class SettingTableViewController: UITableViewController {

    var allSettingCell: [String] = ["공지사항", "실험실", "버전정보"]
    var mySetting: [String] = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var etcSetting: [String] = ["고객센터/도움말"]
    
    var headerTitle: [String] = ["전체 설정", "개인 설정", "기타"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return headerTitle[section]
        } else if section == 1 {
            return headerTitle[section]
        } else if section == 2 {
            return headerTitle[section]
        } else {
            return nil
        }
    }
    
    // 섹션의 개수 나타내주는 함수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitle.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0  {
            return allSettingCell.count
        } else if section == 1 {
            return mySetting.count
        } else {
            return etcSetting.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting")!
        
        // indexPath : 셀은 각각의 섹션내에서 인덱스값이 0,1,2 셀은 0,1,2,3으로 시작됨 >> (0,1), (2, 3)으로 이루어짐
        // 때문에 indexPath.row, indexPath.section을 전달받는다. >> 인덱싱을 활용해 값 설정 가능해진다.
        if indexPath.section == 0 {
            cell.textLabel?.text = allSettingCell[indexPath.row]
            cell.textLabel?.font = .systemFont(ofSize: 12)
        } else if indexPath.section == 1 {
            cell.textLabel?.text = mySetting[indexPath.row]
            cell.textLabel?.font = .systemFont(ofSize: 12)
        } else if indexPath.section == 2 {
            cell.textLabel?.text = etcSetting[indexPath.row]
            cell.textLabel?.font = .systemFont(ofSize: 12)
        }
        
        return cell // setting이라고 이름 붙여준 UITableViewCell을 리턴해줌
    }
}
