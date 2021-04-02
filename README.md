# MyPlaceMap
카카오 오픈 API를 활용한 원하는 장소 저장 & 마커 생성 웹 프로젝트입니다.

### 1. 프로젝트 소개 & 환경
- Java
```java 15.0.2 2021-01-19
Java(TM) SE Runtime Environment (build 15.0.2+7-27)
Java HotSpot(TM) 64-Bit Server VM (build 15.0.2+7-27, mixed mode, sharing)
```
- Oracle Database
```
commons-collections-3.2.1.jar
commons-dbcp-1.2.2.jar
commons-pool.1.4.jar
ojdbc6.jar
```
- JSP
- HTML, CSS
- MyBatis
```
mybatis-3.1.1.jar
```
- Tomcat
```
tomcat v8.5
```
- etc
  - cos.jar
  - taglibs-standard-impl-1.2.5.jar
  - taglibs-standard-spec-1.2.5.jar

### 2. 파일 구조
```bash
.
├── WebContent
│   ├── META-INF
│   ├── WEB-INF
│   │   └── lib
│   │       ├── commons-collections-3.2.1.jar
│   │       ├── commons-dbcp-1.2.2.jar
│   │       ├── commons-pool-1.4.jar
│   │       ├── cos.jar
│   │       ├── mybatis-3.1.1.jar
│   │       ├── ojdbc6.jar
│   │       ├── taglibs-standard-impl-1.2.5.jar
│   │       └── taglibs-standard-spec-1.2.5.jar
│   ├── css
│   ├── font
│   ├── image
│   ├── js
│   │   └── httpRequest.js
│   ├── layout
│   │   ├── check_login.jsp
│   │   ├── footer.jsp
│   │   ├── header.jsp
│   │   └── subIconMenu.jsp
│   └── main
│       ├── board.jsp
│       ├── categorySelectMap.jsp
│       ├── fixedmarkerMain.jsp
│       ├── input.jsp
│       ├── login.jsp
│       ├── loginInsert.jsp
│       ├── mainCategory.jsp
│       ├── mainmap.jsp
│       ├── oneboard.jsp
│       ├── oneshow.jsp
│       ├── previewinfo.jsp
│       ├── random.jsp
│       ├── scheduleView.jsp
│       ├── scheduleWrite.jsp
│       ├── show.jsp
│       └── showallmap.jsp
├── build
│   └── classes
│       ├── action
│       │   ├── BoardListAction.class
│       │   ├── CommentAction.class
│       │   ├── InputAction.class
│       │   ├── LoginAction.class
│       │   ├── LoginCheckAction.class
│       │   ├── LoginInsertAction.class
│       │   ├── LogoutAction.class
│       │   ├── MainMapAction.class
│       │   ├── OneShowAction.class
│       │   ├── OneboardAction.class
│       │   ├── RandomAction.class
│       │   ├── SearchAction.class
│       │   ├── ShowAction.class
│       │   ├── ShowAllMapAction.class
│       │   ├── SubMenuAction.class
│       │   ├── scheduleDeleteAction.class
│       │   ├── scheduleInsertAction.class
│       │   ├── scheduleInsertFormAction.class
│       │   └── scheduleListAction.class
│       ├── config
│       │   └── mybatis
│       │       ├── mapper
│       │       │   ├── map.xml
│       │       │   ├── schedule.xml
│       │       │   └── user.xml
│       │       └── sqlMapConfig.xml
│       ├── dao
│       ├── service
│       └── vo          
└── src
    ├── action
    ├── config
    │   └── mybatis
    │       ├── mapper
    │       │   ├── map.xml
    │       │   ├── schedule.xml
    │       │   └── user.xml
    │       └── sqlMapConfig.xml
    ├── dao
    │   └── MapDAO.java
    ├── service
    │   └── MyBatisConnector.java
    └── vo
        └── MapVO.java
 ```
 
 ### 3. 주요 기능 
 - 로그인, 회원가입
 - 원하는 장소 주소 검색
 - 원하는 장소 마커 생성
   ```
   주소를 검색해 이동하거나 마우스로 지도를 줌인 & 줌아웃해 원하는 장소로 이동할 수 있습니다.
   원하는 지점을 클릭한 후 짧은 메모를 저장할 수 있습니다.
   ```
 - 주변 편의 시설 마커로 안내 (편의점, 병원, 카페 등) 
   ```
   카카오 오픈 API를 이용해 현재 지도 위치에 대한 주변 편의 시설을 마커로 안내합니다.
   ```
 - 한눈에 보기
   ```
   내가 생성한 마커와 마커에 등록한 글, 사진을 한눈에 볼 수 있습니다.
   ```
 - 커뮤니티 게시판
   ```
   내가 선택한 핫플레이스에 대한 게시글 작성, 사진 업로드와 타인의 게시글에 댓글을 작성할 수 있습니다.
   ```
 - 랜덤한 장소 고르기
   ```
   내가 선택한 핫플레이스들을 랜덤으로 보여줍니다. 
   ```
  
 ### 4. 실행 예시 화면
<img width="1063" alt="스크린샷 2021-03-30 오전 11 18 57" src="https://user-images.githubusercontent.com/39934875/112923553-76667b80-9149-11eb-9b70-11d07633ead8.png">
