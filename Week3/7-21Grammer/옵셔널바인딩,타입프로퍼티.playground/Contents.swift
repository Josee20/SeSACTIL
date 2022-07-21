import UIKit

// 옵셔널 바인딩 : if-let, guard let

var noodle: String? = "안성탕면"
var pasta: String? = "토마토파스타"

if noodle != nil {
    print("\(noodle!)을 선택하셨습니다.")
} else {
    print("선택하신 라면이 없습니다.")
}

if let a = noodle {
    print("\(a)을 선택하셨습니다.")
} else {
    print("선택하신 라면이 없습니다.")
}

func practiceGuard() {

    // (2...3).contains(a.count) >> a가 2~3글자를 포함하고 있는지 확인
    guard let a = noodle, let b = pasta, (1...4).contains(a.count), (3...6).contains(b.count) else {
        print("선택하신 라면이 없습니다.")
        return
    }

    print("\(a), \(b)을(를) 선택하셨습니다.")
}

practiceGuard()

// 인스턴스 프로퍼티 vs 타입 프로퍼티

class Coffe {
    var latte = "아이스 카페라떼"
    var americano = "아이스 아메리카노"
    var capuccino = "아이스 카푸치노"
    static var greenTea = "아이스 녹차"
}

var cafe = Coffe()

cafe.americano
cafe.capuccino
cafe.latte

//cafe.greenTea(X) >> 인스턴스화를 하지 않아도 Coffe클래스 자체에 값이 존재한다.
Coffe.greenTea
