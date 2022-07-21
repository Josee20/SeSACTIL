//
//  TrendTableViewController.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/21.
//

import UIKit

class TrendTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func movieButtonClicked(_ sender: UIButton) {
        
        // 화면전환 : 1. 스토리보드 파일 2. 스토리보드 내 뷰컨트롤러 3. 화면전환
        // 영화버튼 클릭 > BucketlistTableViewController Present
        
        // 1.
        let sb = UIStoryboard(name: "Trend", bundle: nil) // bundle이 nil이면 기본위치
        
        // 2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        //3.
        self.present(vc, animated: true)
        
    }
    
    @IBAction func dramaButtonClicked(_ sender: UIButton) {
        
        // 1.
        let sb = UIStoryboard(name: "Trend", bundle: nil) // bundle이 nil이면 기본위치
        
        // 2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        // 2.5 present시 옵션
        vc.modalPresentationStyle = .fullScreen
        
        //3.
        self.present(vc, animated: true)
        
        
    }
    
    @IBAction func bookButtonClicked(_ sender: Any) {
        
        // 1.
        let sb = UIStoryboard(name: "Trend", bundle: nil) // bundle이 nil이면 기본위치
        
        // 2.
        let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
            
        //2.4
        let nav = UINavigationController(rootViewController: vc)
        
        // 2.5 present시 옵션
        nav.modalPresentationStyle = .fullScreen
        
        //3.
        self.present(nav, animated: true)
        
    }
    
}
