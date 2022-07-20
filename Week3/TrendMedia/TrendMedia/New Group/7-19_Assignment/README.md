<br>

# 커스텀 테이블 뷰 셀로 화면 구성해보기
<br>

## 쇼핑리스트 프로젝트(Shopping)

<img width="300" height="550" alt="Simulator Screen Shot - iPhone 11 - 2022-07-20 at 02 22 45" src="https://user-images.githubusercontent.com/92367484/179931241-411cb843-3a1a-485f-956a-c67125a0c5e1.png">

<br>

## 영화목록 프로젝트(Search)
<img width="300" height="550" alt="Simulator Screen Shot - iPhone 11 - 2022-07-20 at 16 58 09" src="https://user-images.githubusercontent.com/92367484/179931270-d03d8600-2b7d-472c-912d-fb735d29d636.png">

<br>

## 주의사항
- 테이블뷰 셀의 identifier를 반드시 지정해주어야한다.(안 헷갈리게 테이블뷰 셀의 이름과 똑같이 하는것도 좋은방법)
- cellForRowsAt 함수에서 반드시 형변환을 테이블뷰 셀로 해주어야한다.(안 그러면 테이블뷰 셀에 접근이 불가)

<br>

## 부족한점
- A구조체로 자료형을 만들고나서 B구조체를 만들어 A구조체 자료형을 배열로 씀과 동시에 멤버와이즈구문으로 초기화시키는 부분에대한 이해(HarryPotter, HarryPotterInfo)
