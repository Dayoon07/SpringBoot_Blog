<div style="width: 100%; padding: 10px 20px;">
  <h2>개발 기간 2024.11.23~</h2>
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
    <td>generated</td>
  </tr>
  <tr>
    <td>username</td>
    <td>varchar2(255)</td>
    <td>unique, not null</td>
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
    <td>generated</td>
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
    <td>varchar2(255)</td>
    <td>not null</td>
  </tr>
  <tr>
    <td>datetime</td>
    <td>varchar2(255)</td>
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
    <td>generated</td>
  </tr>
  <tr>
    <td>blogboard_title</td>
    <td>varchar2(255)</td>
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
    <td>없음</td>
  </tr>
</table>
