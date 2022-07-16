# __넷플릭스 프로젝트__
<br>

### 화면전환


스토리보드에서 버튼에서 드래그 앤 드롭으로 화면전환을 만들 수 있다. 이를 세그라고하는데 아이폰의 경우 Show, PresentModally를 사용하면된다. 나머지는 아이패드에서 사용하는 옵션이다.   

<br>

show와 presentModally에는 차이가 존재한다. show 같은 경우는 화면이 풀스크린으로 잘 나오지만 presentModally 같은 경우는 밑에서 위로 나오는 것을 확인할 수 있다.

https://user-images.githubusercontent.com/92367484/179345996-6c19c4f4-0a5a-4916-a702-f59998a14b04.mp4

물론 변경또한 PrsentModally의 세그를 클릭해 옵션을 변경하는 것도 가능하다. 만약 fullScreen으로 옵션을 변경하는 경우 show와 같이 풀화면으로 나오게 하는 것도 가능하다.

<img width="800" alt="스크린샷 2022-07-16 오후 3 24 42" src="https://user-images.githubusercontent.com/92367484/179346351-a85341e2-0428-4f7b-ac4a-bed5e8b2b3d0.png">


<br>

이는  show의 경우 push - pop 방식을 사용하고 modal같은 경우 present - dismiss 방식과 segue - unwind 방식을 사용하기 때문이다.



show의 경우 Navigation Controller가 존재해야 오른쪽으로 이동 왼쪽으로 뒤로가기 가 가능하다.(아래에서 위로 나오는데 modald 방식과 똑같이 작동한다.)<br>

modal의 present - dismiss 방식은 기본적으로 화면이 아래에서 위로 나오는 영상에서 본 방식과 segue - unwind 방식으로 화면이 떴다가 사라지는 방식이 있다.

<br>

영상에서 modal 방식으로 하면 show와 다르게 뒤로가기 버튼이  안 생겨 재생버튼을 누르면 뒤로가는 것을 확인할 수 있다. 이 설정은 unwindTTransitionFirstVC함수를 사용해주면 된다.
<br>
<img width="250" alt="스크린샷 2022-07-16 오후 3 21 35" src="https://user-images.githubusercontent.com/92367484/179346356-4ef20096-e3c6-4b4a-bec2-233f17f146f2.png">
<img width="750" height="400" alt="스크린샷 2022-07-16 오후 3 21 56" src="https://user-images.githubusercontent.com/92367484/179346359-5393f38b-f43e-4551-a9cf-5d3035437c0d.png">

<br>
주의할 사항은 신델리게이트가 나타난 iOS13.0 부터 Modal 방식도 많이 달라졌는데 iOS13 이전의 Modal의 디폴트 값은 Fullscreen이었고 iOS13 이상부턴 pagesheet가 디폴트니 주의하자.



### 오토레이아웃


### UIAlertController

