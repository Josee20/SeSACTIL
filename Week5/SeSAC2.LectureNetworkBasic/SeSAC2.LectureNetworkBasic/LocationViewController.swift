//
//  LocationViewController.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/07/29.
//

import UIKit

class LocationViewController: UIViewController {
    
    
    // Notofocation 1. 로컬 노티피케이션 가져오기
    let notificationCenter = UNUserNotificationCenter.current()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 왜 카톡이나 배민에서 이쁜 폰트 대신 시스템 폰트를 그대로 사용하는걸까?
        // >> 뛝 뚥빫 같은 텍스트는 등록이 안되어있고 사용이 어렵기 떄문에(자유도 측면)
        // >> 때문에 유저가 만질 수 없는 곳만 폰트로 사용
        
        
        requestAuthorization()
    }
    
    @IBAction func notificationButtonClicked(_ sender: Any) {
        sendNotification()
    }
    
    
    // Notification 2. 권한 요청
    func requestAuthorization() {
        
        // UNAuthorizationOptions 알림, 얼럿, 뱃지 등이 배열로 이루어짐
        let authorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        
        notificationCenter.requestAuthorization(options: authorizationOptions) { success, error in
            
            // 성공했을 때(사용자가 허용했을 때) 알림을 보내라는 의미
            if success {

                self.sendNotification()
            }
            
        }
        
    }
    
    // Notification 3. 권한 허용한 사용자에게 알림 요청(언제? 어떤 컨텐츠?)
    // iOS 시스템에서 알림을 담당하기 때문에 알림등록 코드가 필요!!!
    
    /*
     - 권한 허용 해야만 알림이온다.
     - 권한 허용 문구 시스템적으로 최초 한 번만 뜬다.
     - 허용이 안되어 있는 경우 애플 설정으로 직접 유도하는 코드를 구성해야 한다.
     
     - 기본적으로 알림은 포그라운드에서 수신되지 않는다.
     - 60초 이상 반복 가능(로컬 알림) / 갯수 제한 64개 / 커스텀 사운드 30초
     A      
     1. 뱃지 제거 >> 언제하는게 맞을까? >> 앱이 실행될 때(Active)
     2. 노티제거 >> 노티의 유효기간은??? >> 기본 한 달 >> 카톡(오픈채팅, 단톡 때문에 하나 누르면 다 사라짐) vs 잔디(클릭한거만 지워짐) >> 언제 지울까? >> 런치스크린 or 액티브
     3. 포그라운드 수신? > 델리게이트 메소드로 해결!!!
     
     
     +a
     - 노티는 앱 실행이 기본인데, 특정 노티를 클릭할 때 특정화면으로 가고 싶다면?
     - 포그라운드 수신 > 1 대 1 톡을 하고 있을때엔 수신이 안 되지만(특정 화면에선 안 받고, 특정 조건에 대해서만 포그라운드 수신 하고싶다면?) 다른 방에 있는 메세지들은 받을 수 있음
     - iOS 15 이상부터 생긴 집중모드 등 5~6개의 우선순위 존재!!!
    */
    
    
    
    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "다마고치를 키워보세요"
        notificationContent.subtitle = "오늘 행운의 숫자는 \(Int.random(in: 1...100))입니다."
        notificationContent.body = "저는 따끔따끔 다마고치입니다. 배고파요."
        notificationContent.badge = 40 // integer만 가능
        
        // 언제 보낼 것인가? 1. 시간 간격 2. 캘린더(요일, 월), 3. 위치에 따라 설정 가능
        // 시간 간격은 60초 이상 설정해야 반복 가능
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        var dateComponent = DateComponents()
        dateComponent.minute = 15
        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        // 알림 요청
        // identifier: 스택처럼 쌓일 수 있도록 타임스탬프로 설정함
        // 만약 알림 관리 할 필요 X -> 알림 클릭하면 앱을 켜주는 정도
        // 만약 알림관리 할 필요 O -> 고유 이름, 규칙 등
        // 12개 >
        let request = UNNotificationRequest(identifier: "\(Date())", content: notificationContent, trigger: trigger)
        
        notificationCenter.add(request)
    }
}
