//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/19.
//

import UIKit

class BucketlistTableViewController: UITableViewController {

    @IBOutlet weak var userTextField: UITextField!
    
    var list = ["범죄도시2", "탑건", "토르"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.rowHeight = 80
        
        list.append("마녀")
        list.append("신과함께")
    }
    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        
        list.append(sender.text!)
        
        //중요!!!
        
        // 사실 이런 것을 다 다시 불러줘야하지만 간단하게 reloadData()로 해결할 수 있게 해줌.
        //tableView.numberOfRows(inSection: <#T##Int#>)
        //tableView.cellForRow(at: <#T##IndexPath#>)
        
        tableView.reloadData()
        // IndexSet찾아뽀기
        //tableView.reloadSections(IndexSet, with: <#T##UITableView.RowAnimation#>)
        
        // 여러셀이 변경될 수 있게끔 indexpath를 배열로
//        tableView.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)], with: .fade)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexPath를 임의로 조정해줘야 할 경우가 있기 때문에 for: indexPath를 사용해주는 것이 좋음.
        // 애플이 주는 indexPath를 그대로 사용하겠다면 굳이 for: 매개변수는 안줘도 됨.
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketlistTableViewCell", for: indexPath) as! BucketlistTableViewCell // as? 타입캐스팅 >> 스위프트 파일이랑 화면의 셀이랑 연결을 해준다는 의미
        
        cell.bucketlistLabel.text = list[indexPath.row]
        cell.bucketlistLabel.font = .boldSystemFont(ofSize: 18)
        
        return cell
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // 테이블뷰에 스와이프 같은 편집 기능 활용이 가능해짐
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 스와이프시 삭제하게 해주는 기능
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // 배열 삭제 후 테이블뷰 갱신
            list.remove(at: indexPath.row)
            tableView.reloadData()
            
            // 삭제될 때 추가적인 액션 
//            tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>)
        }
    }

    
    
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 카톡 차단 삭제
//    }
    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        // 카톡 즐겨찾기 핀고정
//    }
    
    
   

}
