//
//  APISearchManager.swift
//  SeSAC2.LectureNetworkBasic
//
//  Created by 이동기 on 2022/08/05.
//

import Foundation

import Alamofire
import SwiftyJSON

class ImageSearchAPIManager {

    private init() { }
    
    typealias completionHandler = (Int, [URL]) -> Void

    // 싱글턴 패턴
    static let shared = ImageSearchAPIManager()

    func fetchImage(query: String, startPage: Int, completionHandler: @escaping completionHandler) {

        // 과자를 UTF-8 인코딩 형태(%형태로 바꿔줌)
        let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = EndPoint.imageSearchURL + "query=\(text)&display=30&start=\(startPage)"

        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]

        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")

                let totalCount = json["total"].intValue

                let imageList = json["items"].arrayValue.map {
                    URL(string: $0["thumbnail"].stringValue)!
                }

                completionHandler(totalCount, imageList)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
