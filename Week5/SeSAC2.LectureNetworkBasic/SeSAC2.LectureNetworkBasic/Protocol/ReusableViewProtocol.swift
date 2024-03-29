//
//  ReusableViewProtocol.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/08/01.
//

import UIKit

protocol ReusableViewProtocol {
    static var reuseIdentifier: String { get }
    
}

extension UIViewController: ReusableViewProtocol { // extension 저장 프로퍼티 사용 불가
    
    static var reuseIdentifier: String { // 연산 프로퍼티일 때 get만 사용한다면 get 생략 가능
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableViewProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
