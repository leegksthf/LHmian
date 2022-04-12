# LHmian (아파트 관리 시스템)
> 2021.09.28 ~ 2021.10.28

> 참여인원: 5명

## 프로젝트 요약

 ### 개발 개요 및 동기
 - 현재 우리나라는 해가 갈수록 고층 아파트의 수가 늘어나고 있다. 고층 건물들을 관리하기 위해선 전문화된 인력과 자원뿐만 아니라, 체계적이고 스마트한 관리 시스템이 필요하다. 하지만 신축 아파트들을 제외하면 여전히 부실한 관리 시스템으로 운영되고 있는 아파트들이 많다는 것을 발견하였다. 
이에  '아파트 관리 웹 애플리케이션'을 개발하였다. 

### 본인 역할
***Front-End***
 * 전체 디자인 및 퍼블리싱을 포함한 프론트 작업
 * 화면 설계
    - 구글 프레젠테이션을 이용해 대략적인 화면구성을 설계
 * 캐러셀 슬라이더를 이용해서 아파트 소개 페이지 작성
 * 부트스트랩과 템플릿을 이용하여 배치도 페이지 작성
 * revolution slider를 변형하여 평형도 페이지 작성
 * 카카오 api를 이용하여 오시는 길 페이지 작성

***Back-End***
 - 게시판 CRUD 기능 구현
   * 관리자와 회원으로 구분하여 게시판별로 CRUD 기능 분배
 * javascript와 j-Query를 통해 체크박스로 전체 선택과 개별 선택 기능 및 선택 삭제 기능 구현


## 개발환경
 - 본 프로젝트는 Spring Framework를 기반으로 MVC 모델을 적용하여 모델-화면-컨트롤러로 분리하여 개발을 하였다. 
 - 다양한 라이브러리의 적용으로 개발시간 단축, 표준화, 유지보수성을 높일 수 있었다.

|개발언어| Spring BootStrap4, HTML5, Javascript, Jquery, Ajax, CSS Mybatis |
|--|--|
| 데이터베이스 | Oracle Database |
|서버| TOMCAT 9.0|
|IDE|Eclipse, SQL Developer|
|빌드 배포|Maven, jenkins|
|형상관리|Github|

### 사용 API
 - Spring Security (https://docs.spring.io/spring-security/site/docs/4.2.12.RELEASE/apidocs/)
 - chart.js (https://www.chartjs.org/)
 - import (https://www.iamport.kr/)
 - kakaomap (https://apis.map.kakao.com/web/)
 - Full Calendar (https://fullcalendar.io/)

## 주요 기능
#### 편의시설 이용 및 결제(독서실, 피트니스 센터)
- 등록 : payment 테이블과, library/gym 테이블에 각각 insert 
- 결제 : iamport 결제 API를 이용한 결제
#### 관리비 조회 및 결제
- 각 관리비 내역에 이번 달 평균과 비교, 이전 달 총액과 비교가 가능하도록 함
- 그 달의 관리비가 미납되어있으면 세대주가 결제할 수 있도록 구현
#### 투표 등록 및 조회, 투표하기
- 진행중, 진행예정, 마감된 투표 순서로 조회가 가능하도록 구현
- 진행 중인 투표는 세대주만 투표할 수 있고, 마감된 투표는 결과 조회만 가능하도록 구현
- 한 번 투표하면 수정하거나 삭제할 수 없음
- 관리자가 투표를 등록할 때 선택지는 10개로 제한. 수정 및 삭제 불가
