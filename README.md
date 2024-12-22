## 프로젝트명 : SpringBoot_Blog
<br>

## 프로젝트 소개
<p style="font-size: 24px;">
  이 프로젝트는 혼자서 진행한 프로젝트로 블로그 플랫폼 구축을 위한 레포지토리입니다.
  주요 기능으로 게시물 작성, 수정, 삭제, 댓글 기능, 좋아요 기능이 있으며
  Spring Boot, JPA를 사용해 만들었습니다.
</p>


<div style="width: 100%; padding: 10px 20px;">
  <h2>개발 기간 2024.11.23~</h2>
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

<h3>blogmember 테이블</h3>
<table>
  <tr>
    <td>필드명</td>
    <td>타입</td>
    <td>제약조건</td>
  </tr>
  <tr>
    <td>memberid</td>
    <td>number</td>
    <td>identity(increment)</td>
  </tr>
  <tr>
    <td>username</td>
    <td>varchar2(255)</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>useremail</td>
    <td>varchar2(255)</td>
    <td>unique, not null</td>
  </tr>
  <tr>
    <td>userpassword</td>
    <td>varchar2(255)</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>joindate</td>
    <td>varchar2(255)</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>profile</td>
    <td>clob</td>
    <td>없음</td>
  </tr>
  <tr>
    <td>selfbio</td>
    <td>clob</td>
    <td>없음</td>
  </tr>
</table><br>

<h3>blogboard 테이블</h3>
<table>
  <tr>
    <td>필드명</td>
    <td>타입</td>
    <td>제약조건</td>
  </tr>
  <tr>
    <td>blog_id</td>
    <td>number</td>
    <td>identity(increment)</td>
  </tr>
  <tr>
    <td>title</td>
    <td>varchar2(255)</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>writer</td>
    <td>varchar2(255)</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>content</td>
    <td>clob</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>views</td>
    <td>number</td>
    <td>default 0</td>
  </tr>
  <tr>
    <td>likes</td>
    <td>number</td>
    <td>default 0</td>
  </tr>
  <tr>
    <td>category</td>
    <td>varchar2(50)</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>datetime</td>
    <td>varchar2(50)</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>commentcount</td>
    <td>NUMBER</td>
    <td>DEFAULT 0</td>
  </tr>
</table><br>

<h3>blogcomment 테이블</h3>
<table>
  <tr>
    <td>필드명</td>
    <td>타입</td>
    <td>제약조건</td>
  </tr>
  <tr>
    <td>commentid</td>
    <td>number</td>
    <td>identity(increment)</td>
  </tr>
  <tr>
    <td>blogboard_title</td>
    <td>varchar2(255)</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>commentasblogid</td>
    <td>number</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>commenter</td>
    <td>varchar2(255)</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>commentcontent</td>
    <td>clob</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>commentdatetime</td>
    <td>varchar2(255)</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>parentcommentid</td>
    <td>number</td>
    <td>default 0</td>
  </tr>
  <tr>
    <td>FK_BLOGCOMMENT_BLOGBOARD</td>
    <td colspan="2">constraint commentasblogid references</td>
  </tr>
</table>

<h2>기능 정리</h2>

<details>
   <summary>댓글 기능</summary>
</details>
