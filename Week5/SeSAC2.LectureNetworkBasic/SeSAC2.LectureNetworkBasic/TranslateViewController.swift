//
//  TranslateViewController.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/07/28.
//

// UIButton, UITextFIeld > Action
// UITextView, UISearcher, UIPickerView > X
// UIControl
// UIResponderChain > resignFirstResponder() / becomeFirstResponder()




import UIKit

class TranslateViewController: UIViewController {

    @IBOutlet weak var userInputTextView: UITextView!
    
    let textViewPlaceholderText = "번역하고 싶은 문장을 작성해 보세요."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 텍스트 뷰의 placeholder를 만들어보자!!!
        
        userInputTextView.delegate = self
        
        userInputTextView.text = textViewPlaceholderText
        userInputTextView.textColor = .lightGray
        
        userInputTextView.font = UIFont(name: "PyeongChangPeace-Light", size: 17)
        

    }
}

extension TranslateViewController: UITextViewDelegate {
    
    // 텍스트가 변할 때 마다 호출
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
    }
    
    // 편집이 시작될 때, 커서가 시잘될 떄
    // 텍스트뷰 글자: 플레이스 홀더랑 글자가 같으면 clear, color
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("Begin")
        
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    // 따로 편집을 끝낼 수 있는 기능은 없음 -> 다른 뷰 객체 클릭
    // 텍스트뷰 글자 : 사용자가 아무 글자도 안쓰면 플레이스 홀더 글자 보이게 해!
    func textViewDidEndEditing(_ textView: UITextView) {
        print("End")
        
        if userInputTextView.text.isEmpty {
            userInputTextView.text = textViewPlaceholderText
            userInputTextView.textColor = .lightGray
        }
    }
}
