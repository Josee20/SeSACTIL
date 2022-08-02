//
//  Constant.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/08/01.
//

import Foundation

struct APIKey {
    static let BOXOFFICE = "f5eef3421c602c6cb7ea224104795888"
    
    static let NAVER_ID = "U7KAnOtk7HeMwNI6bm6U"
    static let NAVER_SECRET = "QlCmslkoI8"
}

struct EndPoint {
    static let boxOfficeURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    static let lottoURL =  "https://www.dhlottery.co.kr/common.do?method=getLottoNumber"
    static let translateURL = "https://openapi.naver.com/v1/papago/n2mt"
}


//enum StoryboardName: String {
//    case Main
//    case Search
//    case Setting
//}
//
//struct StoryboardName {
//
//    // 접근제어를 통해 인스턴스화를 못하도록 할 수도 있음.
//    // private이 붙으면 다른 파일에선 사용이 불가함
//    private init() {
//
//    }
//
//    static let main = "Main"
//    static let search = "Search"
//    static let setting = "Setting"
//}
//
// StoryboardName.search


/*
 enum 안에 타입프로퍼티를 사용하면 좋은점
 
 1. static type property vs enum type porperty => 인스턴스 생성 방지
 2. enum case vs enum static => 중복, case 제약(case는 같은 값 표현 못함)
 
 */



// 열거형은 인스턴스화를 하지 못하기 때문에 타입프로퍼티는 사용이 가능하다.
enum StoryboardName {
    // var nickname = "고래밥" ( X )
    
    static let main = "Main"
    static let search = "Search"
    static let setting = "Setting"
}

enum FontName {
    static let title = "SanFransisco"   //case title = "SanFransisco"
    static let body = "SanFransisco"    //case body = "SanFransisco"
    static let caption = "AppleSandol"  //case caption = "AppleSandol"
}

