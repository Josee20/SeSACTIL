<br>

# WebViewProject

<br>

웹화면을 앱 화면에서 띄울 수 있는 방법에 대해 공부했다. 웹킷(WebKit)과 웹킷뷰(WKWebView)를 활용하면 어렵지 않게 화면을 나타낼 수 있다. 추가적으로 extension 구문을 활용해 서치바의 기능을 델리게이트 패턴을 통해 만들어보았다.

<br>

### 순서

1. URL(string:_)으로 문자열 URL로 인스턴스화 시키기
2. URLRequest(url:_)로 URL요청하기
3. load(_)로 화면 띄우기

<br>

### 주의할점

- UIWebView는 사라졌고 WebKitView를 사용하고 반드시 import할 것
- _.delegate = self 꼭 해주기

<br>

### 보충할점

- 델리게이트 패턴에 대한 공부
- 프로토콜에 대한 이해

<br>



