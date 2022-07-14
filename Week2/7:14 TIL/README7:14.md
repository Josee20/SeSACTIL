

# 클래스(초기화 구문)

클래스와 구조체는 프로퍼티의 값이 초기화되어 있지 않으면 인스턴스를 만들 수가 없다.(메모리에 올릴 수 없다는 의미) 때문에 반드시 둘 중 하나의 방법으로 초기화를 해주어야 한다.

``` 
// 1번 방법
var name: String = "윤정민"
var age: Int = 20
var glassesOn: Bool = true

// 2번 방법
var name: String?
var age: Int?
var glassesOn: Bool?

```

옵셔널을 사용하면 자체적으로 nil값이냐 아니냐를 통해 정할 수 있기 때문에 초기화가 가능해진다.



이 방법 외에 클래스에선 초기화 구문을 제공하는데 이를 사용하면 굳이 위의 두 가지 방법을 이용하지 않아도 인스턴스를 만들 수 있다.

```
init(name: String, age: Int, glassesOn: Bool) {
		self.name = name
		self.age = age
		self.glassesOn = glassesOn
}

let f1 = Friends(name: "윤정민", age: 20, glassesOn: true)
```

여기서 self 키워드를 붙이는 이유는 그냥 name이나 age를 쓰는 경우 가장 가까이 있는 name 즉 프로퍼티가 아니라 매개변수의 값으로 인식하기 때문에 self키워드를 붙여주어 Friends 클래스의 프로퍼티로 인식할 수 있다.



# 구조체(멤버와이즈 구문)

구조체는 클래스에는 없는 멤버와이즈 구문이라는게 존재한다. 따로 init구문을 추가해주지 않고 인스턴스를 만들 때 값을 추가해주면된다.

``` 
var mother = Family(name: "양화심", age = 51, isHuman: true)
let bangWool = Family(name: "방울", age = 5, isHumans: false)
```



# 구조체와 클래스의 차이(메모리 관점)

스위프트는 메모리에 총 4가지 영역이 있다고 한다. 코드, 데이터, 힙, 스택이다.

스위프트에서 클래스를 인스턴스화 하는 경우 메모리 주소는 스택에 쌓이게 되고 값은 힙에 저장된다. 때문에 상수로 인스턴스를 만들어도 값은 다른 영역에 저장되어 수정이 가능하다.



하지만 구조체 같은 경우는 힙에 변수와 값이 같이 저장되기 때문에 인스턴스를 만들 때 let이냐 var에 따라 값을 못 바꿀수도 바꿀수도 있다.







