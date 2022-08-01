//
//  UserDefaultHelper.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/08/01.
//

import Foundation

class UserDefaultHelper {
    
    private init() { }
    
    static let shared = UserDefaultHelper()
    // 자기 자신의 인스턴스를 타입 프로퍼티 형태로 가지고 있음
    
    let userDefaults = UserDefaults.standard // singleton pattern
                                             // 타입프로퍼티는 한 번 호출하면 종료 때 까지 계속 쓰기 떄문에 썼다 안썼다를 하려면 싱글톤 패턴을 이용하는게 좋음
    
    enum Key: String {
        case nickname, age
    }
    
    
    var nickname: String {
        get {
            return userDefaults.string(forKey: Key.nickname.rawValue) ?? "대장" // ?? : nil이라면 대장
        }
        set { //연산 프로퍼티 parameter
            userDefaults.set(newValue, forKey: Key.nickname.rawValue)
        }
    }
    
    var age: Int {
        get {
            return userDefaults.integer(forKey: Key.age.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.age.rawValue)
        }
    }
}
