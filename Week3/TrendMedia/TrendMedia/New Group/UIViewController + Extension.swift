//
//  UIViewController + Extension.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/19.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setBackGroundColor() {
        
        view.backgroundColor = .systemMint
    }
    
    func showAlert(alertTitle: String, alertMessage: String) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "ok", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true)
        
    }
    
}
