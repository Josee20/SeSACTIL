//
//  main.swift
//  환율계산기
//
//  Created by 이3동기 on 2022/07/27.
//

import Foundation

struct ExChangeRate {
    
    var currencyRate: Double {
        
        willSet {
            print("currencyRate willSet - 환율 변동 예정: \(currencyRate) -> \(newValue)")
        }
        
        didSet {
            print("currencyRate didSet - 환율 변동 완료: \(oldValue) -> \(currencyRate)")
        }
    }
    
    var USD: Double {
        
        willSet {
            print("USD willSet - 환전 금액: USD:\(newValue)달러로 환전될 예정")
        }
        
        didSet {
            print("USD didSet - KRW: \(KRW)원 -> \(USD)달러로 환전되었음")
        }
    }
    
    var KRW: Double {
        
        get {
            return USD * currencyRate
        }
        
        set {
            USD = newValue / currencyRate
        }
    }
}

var rate = ExChangeRate(currencyRate: 1100, USD: 1)
rate.KRW = 500000
rate.currencyRate = 1350
rate.KRW = 500000
















