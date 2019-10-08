### 로컬 세팅 순서 ###

* 오라클 기준입니다 (MySql 버전은 추후 추가)

0. [acorn0301-db 다운](https://github.com/acorn0301/hotel/blob/master/DB/acorn0301-db.zip)  
  [Spring war파일 다운](https://drive.google.com/file/d/1xWFtcdvyC4btICnYHxtPh2J767DCdA6k/view?usp=sharing)  
  [react-리뷰게시판 다운](https://drive.google.com/file/d/12e9A6CwmmoLW5tFZV7L9f5_EweQdRR8l/view?usp=sharing) 
1. DB 셋팅 - 새 계정 만들기 : acorn0301 (이 계정명을 사용하면 sql문 수정할 필요 없음. 다른 계정명 쓰고 싶으면 각각의 sql 파일 텍스트편집기로 열어서 create table acorn0301 부분에서 이름을 변경하기 - 대문자 필수  )
2. https://cafe.naver.com/zipsy/2126 => 이 글 참고해서 import 해주기
3. war 파일 이클립스에서 읽어들이기
4. dbproperties 수정 : 현재 사용하는 오라클 데이타가 localhost이므로 주소 바꿔주고, 사용하는 계정명이랑 비밀번호 넣기 
5. 리액트파일(firsthotel-review) 받아서 다운받은 경로로 이동 후 cmd에서 yarn start 해주기 (포트 8081로 설정해뒀는데 변경 원하면 visual studio code로 프로젝트 열어서 server.js 에서 포트번호 바꿀 수 있음.
6. 리액트 압축파일 내부의 readme.txt 참고해서 main.js 의 root 값을 스프링 서버 주소로 바꿔주기
7. 다시 스프링으로 돌아와서 review controller 에서 
```java
//후기 게시판 버튼을 눌렀을 때 
@RequestMapping("/reviewlist.do")
public String reviewlist(HttpServletRequest request, HttpSession session) {

	int member_num = 0;
	if(session.getAttribute("member_num") != null) {
		member_num = (Integer)session.getAttribute("member_num");
	}

	return "redirect:http://firsthotel-review.herokuapp.com/" + member_num;
}
```
마지막 return부분의 주소를 리액트쪽 페이지 주소로 변경하기(http://localhost:8081/)

### 막힐경우 당황하지 말고 조장을 찾아주세요 :)
