//
//  ViewController.swift
//  Netflix2
//
//  Created by 이동기 on 2022/07/15.
//

import UIKit

enum MovieName: String {
    case 겨울왕국2
    case 괴물
    case 명량
}

class ViewController: UIViewController {

    @IBOutlet var movieBtn: [UIButton]!
    
    @IBOutlet weak var backImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<movieBtn.count {
            movieBtn[i].layer.cornerRadius = 55
            movieBtn[i].layer.borderColor = UIColor.darkGray.cgColor
            movieBtn[i].layer.borderWidth = 5
            movieBtn[i].clipsToBounds = true
        }
    }
    
    @IBAction func frozenKingdomClicked(_ sender: UIButton) {
        backImage.image = UIImage(named: MovieName.겨울왕국2.rawValue)
    }
    
    @IBAction func monsterClicked(_ sender: UIButton) {
        backImage.image = UIImage(named: MovieName.괴물.rawValue)
    }
    
    @IBAction func myeongRyangClicked(_ sender: UIButton) {
        backImage.image = UIImage(named: MovieName.명량.rawValue)
    }
    
    @IBAction func listBtnClicked(_ sender: UIBarButtonItem) {
        showAlertController()
    }
    
    @IBAction func checkBtnClicked(_ sender: UIBarButtonItem) {
        showActionsheetController()
    }
    
    func showAlertController() {
        
        // 1. 흰색 바탕 만들기 + 글씨 넣어주기
        let alert = UIAlertController(title: "타이틀", message: "여기는 메시지가 들어갑니다", preferredStyle: .alert)
        
        // 2. 버튼 만들어 주기
        let ok = UIAlertAction(title: "확인", style: .destructive, handler: nil)
        let cancel = UIAlertAction(title: "취소버튼입니다", style: .cancel, handler: nil)
        let web = UIAlertAction(title: "새 창으로 열기", style: .default, handler: nil)
        let copy = UIAlertAction(title: "복사하기", style: .default, handler: nil)
        
        // 3. 합쳐주기
        alert.addAction(copy)
        alert.addAction(web)
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 4. 띄어주기
        present(alert, animated: true, completion: nil)
    }
    
    func showActionsheetController() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let no = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        let check = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        let share = UIAlertAction(title: "공유하기", style: .default, handler: nil)
        let copy = UIAlertAction(title: "복사하기", style: .default, handler: nil)
        
        alert.addAction(no)
        alert.addAction(check)
        alert.addAction(share)
        alert.addAction(copy)
        
        present(alert, animated: true, completion: nil)
    }
}

