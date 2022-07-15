//
//  JackFlixViewController.swift
//  Netflix2
//
//  Created by 이동기 on 2022/07/15.
//

import UIKit

class JackFlixViewController: UIViewController {

    @IBOutlet var textFieldGroup: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<textFieldGroup.count {
            switch i {
            case 0:
                textFieldGroup[i].placeholder = "이메일 주소 또는 전화번호"
            }
            
            textFieldGroup[i].textColor = .white
            textFieldGroup[i].textAlignment = .center
            textFieldGroup[i].borderStyle = .roundedRect
        }
        
    }
    

    

}
