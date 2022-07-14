import Foundation

class Friends {
    var name: String
    var age: Int
    var glassesOn: Bool
    
    // 이니셜라이저
    init(name: String, age: Int, glassesOn: Bool) {
        self.name = name
        self.age = age
        self.glassesOn = glassesOn
    }
}

let f1  = Friends(name: "윤정민", age: 20, glassesOn: true) // 값 변경 가능

f1.name       // 윤정민
f1.age        // 20
f1.glassesOn  // true

var f2 = f1

f2.name = "서승우"
f2.age = 21
f2.glassesOn = false

print(f1.name, f1.age, f1.glassesOn) // 서승우 21 false
print(f2.name, f2.age, f2.glassesOn) // 서승우 21 false


struct Family {
    var name: String
    var age: Int
    var isHuman: Bool
}

var mother = Family(name: "양화심", age: 51, isHuman: true)  // 후에 변경가능
let bangWool = Family(name: "방울", age: 5, isHuman: false) // 후에 변경 불가능

mother.age = 20 // (X)
bangWool.age = 10 // (O)

