//
//  LottoViewController.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/07/28.
//

import UIKit

// 1. import
import Alamofire
import SwiftyJSON

class LottoViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    // @IBOutlet weak var lottoPickerView: UIPickerView!
    
    var lottoPickerView = UIPickerView()
    // 코드로 뷰를 만드는 기능이 훨씬 더 많이 남아있음
    @IBOutlet var lottoNum: [UILabel]!
    
    let numberList: [Int] = Array(1...1025).reversed()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 문자로 인증번호 오면 바로 쓸 수 있는 것
        // numberTextField.textContentType = .oneTimeCode
        
        numberTextField.tintColor = .clear
        numberTextField.inputView = lottoPickerView // 텍스트필드를 클릭했을 때 피커뷰를 보여주고 싶다!
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
        
        //requestLotto(number: json["drwNo"].integerValue)

   
    }
    
    func requestLotto(number: Int) {
        
        let url = "\(EndPoint.lottoURL)&drwNo=\(number)"
        // 접두어를 Alamofire 대신 AF로 바꿔주자.
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for i in 1...7 {
                    if i < 7 {
                        self.lottoNum[i-1].text = json["drwtNo\(i)"].stringValue
                    } else {
                        self.lottoNum[i-1].text = json["bnusNo"].stringValue
                    }
                }
                
                let date = json["drwNoDate"].stringValue
                print(date)
                print(Date())
                
                self.numberTextField.text = date
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        requestLotto(number: numberList[row])
//        numberTextField.text = "\(numberList[row])회차"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
}

