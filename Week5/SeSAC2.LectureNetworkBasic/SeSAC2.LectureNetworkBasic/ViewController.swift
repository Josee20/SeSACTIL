//
//  ViewController.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/07/27.
//

import UIKit

class ViewController: UIViewController, ViewPresentableProtocol {
    
    static var identifier: String = "ViewController"
    
    // navigationTitleString의 경우 { get set }이기 떄문에 상수로 쓰면 쓰는 것이 불가능해져 오류가 발생함
    var navigationTitleString: String {
        get {
            return "대장님의 다마고치"
        }
        set {
            title = newValue
        }
    }
    
    // 상수면?
    var backgroundColor: UIColor {
        
        get {
            return .blue
        }
    }
    
    func configureView() {
        
        navigationTitleString = "고래밥의 다마고치"
//        backgroundColor = .red
        
        title = navigationTitleString
        view.backgroundColor = backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        UserDefaultHelper.shared.nickname = "고래밥"
        
        title = UserDefaultHelper.shared.nickname
        
        UserDefaultHelper.shared.age = 80
        
        
        
    }
    
    func configureLabel() {
        view.backgroundColor = .red
    }


}

