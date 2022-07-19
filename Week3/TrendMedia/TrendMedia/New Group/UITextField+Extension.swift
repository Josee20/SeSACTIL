//
//  UITextField+Extension.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/19.
//

import UIKit

extension UITextField {
    
    func  borderColor() {
        // textfield는 view 처럼없기 때문에 self를 붙여줘야 UITextField에 적용이 됨
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.borderStyle = .none
        // self.placeholder = placeholder // 등록이 되어버리기 때문에 저장프로퍼티는 익스텐션에 사용이 불가하다!
        
    }
}




