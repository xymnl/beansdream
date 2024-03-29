# beansdream

- 원두 소개와 바리스타 수강신청을 활용한 웹애플리케이션 프로젝트입니다.
- 모든 페이지에 미디어쿼리를 사용하여 웹 페이지의 디자인과 레이아웃이 모든 화면 크기에 맞게 하는 반응형 웹으로 구현되었습니다.

- 세부구현기능
- 메인화면
- 바리스타 수강신청 화면
- 회원관리 화면

## 개발환경

- Spring
- JSP
- Jquery
- JDK 11
- MySQL
- Tomcat 9.0

## 프론트엔드 / 백엔드 개발

- 전반적인 프로젝트 화면을 구축하고 사용자 인터페이스를 개발하였습니다.
- HTML, CSS, JavaScript, Jquery 등을 활용하여 UI를 구성하고 동적인 기능을 추가하였습니다.
- 사용자의 상호작용에 따라 동적으로 데이터를 로드하고 화면을 업데이트하였습니다.
- 반응형 디자인을 적용하여 다양한 화면 크기와 장치에 대한 최적화를 실시하였습니다.
- DB 설계 및 연결 작업과 데이터를 주고받을 수 있는 API 개발을 통해 바리스타 과정을 신청하고 관리할 수 있는 시스템을 개발하였습니다.

## ERD Diagram

<p align="center">
  <img src="./readImg/ERD.png" alt="ERD IMG"/>
</p>

## 메인 화면

<p align="center" styel="display:flex; ">
  <img src="./readImg/fhd.png" alt="fhd" style="height:150px" />
  <img src="./readImg/hd.png" alt="fhd" style="height:150px" />
  <img src="./readImg/tbl.png" alt="fhd" style="height:150px" />
  <img src="./readImg/sm.png" alt="fhd" style="height:150px" />
</p>

- 미디어쿼리에 따른 반응형 웹 구현.
- 회원가입시 입력정보 조건에 알맞도록 제어.
- 회원페이지 정보조회 및 회원정보 수정/회원 탈퇴.
- 관리자계정으로 로그인시 회원정보 제어권한 부여.

## 바리스타 수강 신청

<p align="center">
  <img src="./readImg/application.png"  alt="application"/>
</p>

- 수강 신청/삭제 기능
- 신청 목록 검색 기능

## 회원 관리

<p align="center" style="display:flex;">
  <img src="./readImg/myinfo.png" alt="myinfo" style="height:200px;"/>
  <img src="./readImg/list.png" alt="list" style="height:200px;"/>
</p>

- 마이페이지 사용자 주문/개인정보 수정, 회원탈퇴 기능
