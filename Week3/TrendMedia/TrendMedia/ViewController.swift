//
//  ViewController.swift
//  TrendMedia
//
//  Created by 이동기 on 2022/07/18.
//

import UIKit

class Monster {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}





class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var date2Label: UILabel!
    
    @IBOutlet var dateLabelCollection: [UILabel]!
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var yellowViewLeadingConstraints: NSLayoutConstraint!
    // 언제 아웃렛컬렉션을 사용하는게 좋을까?
    
    // let sample = ViewController() 안 짜는 이유?
    // 스토리보드 상에서 이미 초기화를 해주기 때문에
    
    
    // 변수의 스코프(사용 빈도가 많은 경우 함수 바깥에 설정하는 것이 좋다.)
    let format = DateFormatter()
    
    /* 클래스, 구조체에선 언제 실행이 될지 모르기 때문에 선언 안 됨!!!
    format.dateFormat = "yyyy/MM/dd"
    dateLabel.text = "AAAA"
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        format.dateFormat = "yyyy/MM/dd"
        
        yellowViewLeadingConstraints.constant = 120
        
        // .init은 생략이 가능하다
        // UIAlertController.init(title: <#T##String?#>, message: <#T##String?#>, preferredStyle: <#T##UIAlertController.Style#>)
        // let format = DateFormatter.init()
        // let format2 = DateFormatter()
        
    }
    
    func configureLabelDesign() {
        // 1. OutletCollection(디자인 적인 요소(UIView))
        for i in dateLabelCollection {
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .brown
        }
        
        // 인덱스를 활용해 접근할 경우 후에 레이블이 추가되면 꼬일 수 있음
        dateLabelCollection[0].text = "첫번째 텍스트"
        dateLabelCollection[1].text = "두번째 텍스트"
        
        // 2. UILabel
        // labelArray는 이 함수 내부에서만 사용이 가능하다.
        let labelArray = [dateLabel, date2Label]
        for i in labelArray {
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .brown
        }
        
        dateLabel.text = "첫번째 텍스트"
        date2Label.text = "두번째 텍스트"
        
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        let format = DateFormatter()
        format.dateFormat = "yyyy/MM/dd"
        
        dateLabel.text = format.string(from: sender.date)
        
        
    }
    
}

