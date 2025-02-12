## 프로젝트명 : SpringBoot_Blog
<br>

## 프로젝트 소개
<p style="font-size: 24px;">
  이 프로젝트는 혼자서 진행한 프로젝트로 블로그 플랫폼 구축을 위한 레포지토리입니다.
  주요 기능으로 게시물 작성, 수정, 삭제, 댓글 기능, 좋아요 기능이 있으며
  Spring Boot, JPA를 사용해 만들었습니다.
</p>


<div style="width: 100%; padding: 10px 20px;">
  <h2>개발 기간 2024. 11. 23~</h2>
</div>

<div align="center">
  <h2>IDE</h2>
  <div style="display: flex;">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRtQyXi1necbFlJOetK3_3MHaLeHDGZ-C3pw&s" width="150" height="150">
    <img src="https://upload.wikimedia.org/wikipedia/en/thumb/6/68/Oracle_SQL_Developer_logo.svg/800px-Oracle_SQL_Developer_logo.svg.png" width="150" height="150">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/2048px-Visual_Studio_Code_1.35_icon.svg.png" width="150" height="150">
  </div>
  <h3>Server : Spring Boot 내장 서버</h3>
  <h3>프레임워크</h3>
  <div style="display: flex;">
    <img src="https://velog.velcdn.com/images/alsgudtkwjs/post/7e8d4ffb-67bb-441a-87f4-be01d1ede318/image.png" width="380" height="325">
    <img src="https://getlogovector.com/wp-content/uploads/2021/01/tailwind-css-logo-vector.png" width="450" height="250">
  </div>
  <h3>언어</h3>
  <div style="display: flex;">
    <img src="https://static-00.iconduck.com/assets.00/java-original-icon-756x1024-j3tx11wk.png" width="150" height="150">
    <img src="https://blog.kakaocdn.net/dn/uyDoO/btrUvXWoORO/r9I7YkYSnihkTq2vpJqlv1/img.png" width="300" height="168">
    <img src="https://developers.websharper.com/img/jslogo.png" width="150" height="150">
  </div>
  <h3>라이브러리</h3>
  <div style="display: flex;">
    <img src="https://velog.velcdn.com/images/gloom/post/17bae182-7380-43e0-a45e-fff76b8ba9c7/image.png" width="294" height="247">
    <img src="https://camo.githubusercontent.com/f8cb17a34ed54e31a5d35ad6598dbffb019faa75833409ed9bb4db87dc3c7714/68747470733a2f2f626c6f672e6b616b616f63646e2e6e65742f646e2f6c757556582f627472594978796f4667682f6b6a3545724d507975724136686d4b644a714831486b2f696d672e706e67" width="250" height="150">
  </div>
</div>

![이미지](https://dayoon07.github.io/static-page-test/img/SpringBoot_Blog-ERD.png)

## 로그인
- **비밀번호 암호화:** `bcrypt`를 사용하여 안전한 비밀번호 저장  
- **사용자 이름 중복 확인:** 회원가입 시 사용자 이름의 중복 여부 확인  

---

## 파일 업로드
- **프로필 사진 업로드:** 사용자 프로필 사진 파일 업로드 기능  
- **비디오, 이미지 파일 입출력:** 글 작성 시 비디오 및 이미지 파일 첨부 가능  

---

## 글 작성
- **Markdown 문법 지원:** `Markdown`을 활용한 서식 있는 글 작성  
- **서식 있는 텍스트 추가:** 다양한 텍스트 스타일 적용 가능  
- **미리보기 화면:** 작성한 글을 실시간으로 미리보기  
- **글 수정:** 작성한 글을 편집할 수 있는 기능  
- **글 삭제:** 불필요한 글 삭제 기능  

---

## 댓글
- **댓글 입력:** 게시글에 대한 댓글 작성 기능  
- **댓글 수정:** 작성한 댓글을 편집하는 기능  
- **댓글 삭제:** 작성한 댓글을 삭제하는 기능  
- **댓글 개수 저장:**  
  - 댓글 작성 시 `REST API`로 댓글 개수를 요청  
  - 특정 글의 `commentCount` 필드에 댓글 개수 저장  

---

## 검색
- **검색 기능:**  
  - `JPA`의 메서드 이름 기반 쿼리 생성  
  - 게시글 및 댓글 등 다양한 데이터 검색 가능  

---

## 좋아요
- **좋아요 추가:** 게시글에 좋아요를 눌러 선호도 표시  
- **좋아요 취소:** 누른 좋아요를 다시 취소할 수 있는 기능  
- **내가 누른 좋아요 확인:** 사용자가 누른 모든 좋아요 목록 조회
