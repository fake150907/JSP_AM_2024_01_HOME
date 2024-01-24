<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%
List<Map<String, Object>> memberRows = (List<Map<String, Object>>) request.getAttribute("memberRows");
String loginId = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>

	<div>
		<a style="color: green" href="../home/main">메인으로 돌아가기</a>
	</div>
	<a href="http://www.naver.com"
		onclick="if(confirm('진짜 이동 할거야?')==false) return false;">naver</a>
	<h2>회원가입</h2>
	   
	<script type="text/JavaScript"
		src="http://code.jquery.com/jquery-1.7.min.js"></script>

	<script type="text/javascript">
		function passConfirm() {
			var loginPw = document.getElementById('loginPw'); //비밀번호 
			var loginPwchk = document.getElementById('loginPwchk'); //비밀번호 확인 값
			var confrimMsg = document.getElementById('confirmMsg'); //확인 메세지
			var correctColor = "#00ff00"; //맞았을 때 출력되는 색깔.
			var wrongColor = "#ff0000"; //틀렸을 때 출력되는 색깔

			if (loginPw.value == loginPwchk.value) {//loginPw 변수의 값과 loginPwchk 변수의 값과 동일하다.
				confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
				confirmMsg.innerHTML = "비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
			} else {
				confirmMsg.style.color = wrongColor;
				confirmMsg.innerHTML = "비밀번호 불일치";
			}
		}
		var JoinForm__submitDone = false;
		function JoinForm__submit(form) {
			/* 교양으로 알면 좋은것  */
			if (JoinForm__submitDone) {
				alert('이미 처리중입니다.');
				return;
			}
			var loginId = form.loginId.value.trim();
			var loginPw = form.loginPw.value.trim();
			var loginPwChk = form.loginPwChk.value.trim();
			var name = form.name.value.trim();

			console.log('form.loginId.value : ' + loginId);
			console.log('form.loginPw.value : ' + loginPw);
			console.log('form.loginPwChk.value : ' + loginPwChk);
			console.log('form.name.value : ' + name);
			if (loginId.length == 0) {
				alert('아이디를 입력해주세요');
				form.loginId.focus();
				return;
			}
			if (loginPw.length == 0) {
				alert('비밀번호를 입력해주세요');
				form.loginPw.focus();
				return;
			}
			if (loginPwChk.length == 0) {
				alert('비밀번호 확인을 입력해주세요');
				form.loginPwChk.focus();
				return;
			}

			if (loginPw != loginPwChk) {
				alert('비밀번호가 일치하지 않습니다.');
				form.loginPw.focus();
				return;
			}
			if (name.length == 0) {
				alert('이름을 입력해주세요');
				form.name.focus();
				return;
			}
			JoinForm__submitDone = true;
			form.submit();
		}

		function checkid(loginId) {

			window.open("loginIdConfirm?loginId=" + loginId,
					"width=400 height=350")
		}
	</script>

	<form method="POST" action="dojoin"
		onsubmit="JoinForm__submit(this); return false;">
		<div>
			로그인 아이디 : <input autocomplete="off" type="text"
				placeholder="사용할 아이디를 입력해주세요." name="loginId" id="loginId"
				style="width: 200px" /> <input type="button"
				onclick="checkid(loginId.value);" value="ID 중복확인"><br>
		</div>
		<div>
			로그인 비밀번호 : <input type="text" autocomplete="off"
				placeholder="사용할 비밀번호를 입력해주세요." name="loginPw" class="loginPw" />
		</div>
		<div>
			로그인 비밀번호 확인 : <input type="text" autocomplete="off"
				placeholder="비밀번호를 확인해주세요." name="loginPwChk" class="loginPwChk" />
			<div class="confirmMsg"></div>
		</div>
		<div>
			이름 : <input type="text" autocomplete="off" placeholder="성함을 입력해주세요."
				name="name" />
		</div>
		<button type="submit">회원가입</button>
	</form>

	<div>
		<a style="color: green" href="../article/list">리스트로 돌아가기</a>
	</div>

</body>
</html>