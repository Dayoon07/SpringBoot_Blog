# Oracle DB : 21 

## 1. blogmember

| 필드명       | 타입          | 크기      | NULL 여부 | 비고                             |
|--------------|---------------|-----------|-----------|----------------------------------|
| userId       | NUMBER        |           | NOT NULL  | Primary Key, 자동 증가           |
| username     | VARCHAR       | 100       | NOT NULL  |                                  |
| useremail    | VARCHAR       | 100       | NOT NULL  |                                  |
| userpassword  | VARCHAR       | 200       | NOT NULL  |                                  |
| profiletext  | VARCHAR       | 255       | NULL      |                                  |
| dateTime     | TIMESTAMP     |           | NULL      | 기본값: CURRENT_TIMESTAMP       |
| followerId   | NUMBER        |           | NULL      | 기본값: 0                        |
| followedId   | NUMBER        |           | NULL      | 기본값: 0                        |

## 2. blogboard

| 필드명       | 타입          | 크기      | NULL 여부 | 비고                             |
|--------------|---------------|-----------|-----------|----------------------------------|
| blogId       | NUMBER        |           | NOT NULL  | Primary Key, 자동 증가           |
| writer       | VARCHAR2      | 100       | NOT NULL  |                                  |
| title        | VARCHAR2      | 255       | NOT NULL  |                                  |
| blogContent  | CLOB          |           | NOT NULL  |                                  |
| blogviews    | NUMBER        |           | NULL      |                                  |
| dateTime     | TIMESTAMP     |           | NULL      | 기본값: CURRENT_TIMESTAMP       |

## 3. blogcomment

| 필드명        | 타입          | 크기      | NULL 여부 | 비고                             |
|---------------|---------------|-----------|-----------|----------------------------------|
| commentId     | NUMBER        |           | NOT NULL  | Primary Key, 자동 증가           |
| blogId        | NUMBER        |           | NOT NULL  | 외래 키, blogboard(blogId) 참조 |
| userId        | NUMBER        |           | NOT NULL  | 외래 키, blogmember(userId) 참조|
| commentContent | CLOB         |           | NOT NULL  |                                  |
| dateTime      | TIMESTAMP     |           | NULL      | 기본값: CURRENT_TIMESTAMP       |

## 4. bloglike

| 필드명        | 타입          | 크기      | NULL 여부 | 비고                             |
|---------------|---------------|-----------|-----------|----------------------------------|
| likeId        | NUMBER        |           | NOT NULL  | Primary Key, 자동 증가           |
| blogId        | NUMBER        |           | NOT NULL  | 외래 키, blogboard(blogId) 참조 |
| userId        | NUMBER        |           | NOT NULL  | 외래 키, blogmember(userId) 참조|
| dateTime      | TIMESTAMP     |           | NULL      | 기본값: CURRENT_TIMESTAMP       |
| UNIQUE        | (blogId, userId)|         |           | 블로그와 사용자 조합에 대한 고유 제약 조건 |

## 5. blognotice

| 필드명        | 타입          | 크기      | NULL 여부 | 비고                             |
|---------------|---------------|-----------|-----------|----------------------------------|
| noticeid      | NUMBER        |           | NOT NULL  | Primary Key, 자동 증가           |
| noticetitle   | VARCHAR2      | 1500      | NOT NULL  |                                  |
| noticecontent  | CLOB         |           | NOT NULL  |                                  |
| dateTime      | TIMESTAMP     |           | NULL      | 기본값: CURRENT_TIMESTAMP       |
