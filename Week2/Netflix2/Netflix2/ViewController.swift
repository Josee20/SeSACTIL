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
}

