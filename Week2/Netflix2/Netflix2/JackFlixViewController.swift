//
//  JackFlixViewController.swift
//  Netflix2
//
//  Created by 이동기 on 2022/07/15.
//

import UIKit

class JackFlixViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textFieldGroup: [UITextField]!
    @IBOutlet weak var signUpBtn: UIButton!
   
    @IBOutlet weak var switchBtn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<textFieldGroup.count {
            switch i {
            case 0:
                textFieldGroup[i].placeholder = "이메일 주소 또는 전화번호"
                textFieldGroup[i].keyboardType = .emailAddress
            case 1:
                textFieldGroup[i].placeholder = "비밀번호"
                textFieldGroup[i].keyboardType = .numberPad
                textFieldGroup[i].isSecureTextEntry = true
            case 2:
                textFieldGroup[i].placeholder = "닉네임"
            case 3:
                textFieldGroup[i].placeholder = "위치"
            case 4:
                textFieldGroup[i].placeholder = "추천 코드 입력"
                textFieldGroup[i].keyboardType = .numberPad
            default:
                print("")
            }
            
            textFieldGroup[i].textColor = .white
            textFieldGroup[i].textAlignment = .center
            textFieldGroup[i].borderStyle = .roundedRect
        }
        
        signUpBtnStyle()
        switchBtnStyle(onTintCol: .red, thumbTintCol: .gray)
        
        for  i in 0..<textFieldGroup.count {
            textFieldGroup[i].delegate = self
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func signUpBtnStyle() {
        signUpBtn.setTitle("회원가입", for: .normal)
        signUpBtn.setTitleColor(.black, for: .normal)
        signUpBtn.titleLabel?.font = .boldSystemFont(ofSize: 22)
    }
    
    func switchBtnStyle(onTintCol: UIColor, thumbTintCol: UIColor) {
        switchBtn.onTintColor = onTintCol
        switchBtn.thumbTintColor = thumbTintCol
    }
    
    @IBAction func backgroundClicked(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func signUpBtnClicked(_ sender: Any) {
        view.endEditing(true)
    }
}
