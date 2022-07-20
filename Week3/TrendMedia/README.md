<br>

# 테이블뷰 컨트롤러로 화면 만들기(Setting Table View Controller)

<br>

## Static Table View

<img width="300" height="550" alt="Simulator Screen Shot - iPhone 11 - 2022-07-18 at 21 06 05" src="https://user-images.githubusercontent.com/92367484/179507658-8de1f9ca-3984-42e7-9ccf-c85c874f978b.png">
<br>

## Dynamic Table View
<img width="300" height="550" alt="Simulator Screen Shot - iPhone 11 - 2022-07-18 at 20 37 21" src="https://user-images.githubusercontent.com/92367484/179506931-08d84591-45e3-44bf-950c-6fabb4549165.png">
<br>

## 주의사항
- Static은 스토리보드로 Dynamic은 코드로
- Dynamic의 경우 numberOfRowsInSection함수와 setForRowsAt 함수가 필수
- setForRowsAt함수 사용시 테이블뷰의 identifier 꼭 확인

<br>

## 부족한점

- indexPath로 section과 cell을 인덱싱해서 사용하는 것에 대한 이해
- 열거형의 CaseIterable에 대한 이해
