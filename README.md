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
- etc
  - cos.jar
  - taglibs-standard-impl-1.2.5.jar
  - taglibs-standard-spec-1.2.5.jar

### 2. 파일 구조
```bash
.
├── WebContent
│   ├── META-INF
│   │   ├── MANIFEST.MF
│   │   └── context.xml
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
 
 ### 3. 구동 방식
 
 ### 4. 실행예시 화면
<img width="1063" alt="스크린샷 2021-03-30 오전 11 18 57" src="https://user-images.githubusercontent.com/39934875/112923553-76667b80-9149-11eb-9b70-11d07633ead8.png">
