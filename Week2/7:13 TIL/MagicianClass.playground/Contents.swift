class Magician {
    
    var STR = 11
    var DEX = 23
    var INT = 300
    var LUK = 123
    
    func energyBolt() {
        print("에너지볼트!!")
    }
}

class FireMagician: Magician {
    
    // super키워드는 메소드에서만 가능한가?
    // super.INT = 500
    // 더 복잡한 과정이 필요하다고 하는데 아직은 이해하기가 힘든 개념이었다.
    
    
    func meteor() {
        print("메테오!")
    }
    
    override func energyBolt() {
        super.INT = 500
        print("파이어볼트!")
    }
}

var basicMagician = Magician()
var fireMagician = FireMagician()

fireMagician.INT      // 500
basicMagician.INT     // 300 >> 참조에 의한 전달이라 500으로 바뀔줄 알았는데 왜 안바뀌는걸까??

var iceMagician = basicMagician

iceMagician.INT = 4000

print(basicMagician.INT) // 4000
print(iceMagician.INT)   // 4000
print(fireMagician.INT)  // 500
