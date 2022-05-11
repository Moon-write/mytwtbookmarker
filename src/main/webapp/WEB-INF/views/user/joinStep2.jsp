<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	.agreebox{
		margin: 20px auto;
		text-align: center;
	}
	.hidden{
		display: none !important;
	}
	label{
		margin-top: 5vh;
	}
	.email-wrap, .verify-wrap{
		display: flex;
		align-items: center;
		margin-bottom: 1vh;
	}
	
	input[name=emailId],select[name=emailDomain]{
		width: 39%;
		margin-right: 1%;
	}
	input[name=userEmail]{
		width: 79%;
		margin-right: 1%;		
	}
	#timeChk{
		width: 10%;
		text-align: center;
		color : #FF0000;
	}
	#emailVerify{
		width: 69%;
		margin-right: 1%;
	}
	#sendBtn, #verifyBtn {
		width: 20%;
		
	}
	
	@media (hover: hover) and (pointer: fine) { 
		input[type=submit]{
			width: 60%;
			margin-top: 20px !important;
		}
		.noticeMsg{
			font-size: 0.8em;
			margin-left: 10px;
		}
	}
	
	@media screen and (hover: hover) and (pointer: coarse) { /*모바일*/
		.agreebox{
			margin: 50px auto;
			font-size:1.5em; 
		}
		
		button{
			width: 80%; height: 150px;
			font-size: 5em;
			margin-top: 100px !important;
		}
	}	
</style>
</head>
<body>    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <content>
        <div class="div-content">
            <div class="div1-box">
                <div class="title">회원가입</div>
                <div class="info-wrap">
                	<form action="" method="post" enctype="multipart/form-data">
                		<label for="userId" class="form-label">아이디 *</label><span id="idChk" class="noticeMsg"></span>
                		<input type="text" name="userId" class="form-control" placeholder="영문 소문자+숫자 조합 8~20자">
                		
                		<label for="userPw" class="form-label">비밀번호 *</label><span id="pwChk" class="noticeMsg"></span>
                		<input type="password" name="userPw" class="form-control" placeholder="영문 소문자+숫자+특수문자(!@#$-) 조합 8~20자">
                		
                		<label for="userPwRe" class="form-label">비밀번호 확인 *</label><span id="pwChkRe" class="noticeMsg"></span>
                		<input type="password" name="userPwRe" class="form-control" placeholder="비밀번호와 일치해야 합니다">
                		
                		<label for="userName" class="form-label">닉네임 *</label>
                		<input type="text" name="userName" class="form-control" placeholder="미풍양속을 해치는 닉네임은 관리자에 의해 임의 변경될 수 있습니다">
                		
                		<label for="emailId" class="form-label">이메일 *</label>
                		<div class="email-wrap">
	                		<input type="text" name="emailId" class="form-control" placeholder="아이디 입력">
	                		<select name="emailDomain" class="form-select">
	                			<option>도메인 선택</option>
	                			<option value="@naver.com">@naver.com</option>
	                			<option value="@gmail.com">@gmail.com</option>
	                			<option value="@kakao.com">@kakao.com</option>
	                			<option value="@">직접입력</option>
	                			<option value="">선택안함</option>
	           				</select>
	                		<input type="text" name="userEmail" class="form-control" style="display:none;">
	           				<button onclick="verify(); return false;" class="btn btn-secondary" id="sendBtn">인증메일 전송</button>
                		</div>
                		<div class="verify-wrap hidden">
                			<span id="timeChk"></span>
	           				<input type="text" id="emailVerify" class="form-control">
	           				<button onclick="codeChk(); return false;" class="btn btn-secondary" id="verifyBtn">인증</button>
                		</div>
           				
           				
           				
           				프로필사진
           				<input type="file" name="profilePic">
           				<div class="profilePicWindow">여기사진이뜰거임</div>
                	</form>

                </div>
                <div class="agreebox"> 
	                <input type="submit" id="submitBtn" class="btn btn-lg btn-primary" onclick="enter()" disabled value="회원가입">
                </div>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
    	function enter(){
    		// 입력내용 확인
    	}
    	$(".info-wrap input[name=userId]").on("change",function(){
    		const userId = $(this).val();
    		
    		let regExp;
    		regExp = /^[a-z0-9]{8,12}$/;
    		
    		if(regExp.test(userId)){
    			//정규표현식 만족
	    		$.ajax({
	    			url : "/checkId.do",
	    			data : {userId : userId},
	    			type: "post",
	    			success: function(data){
	    				if(data==0){
	    					$("#idChk").text("사용 가능한 아이디입니다.");
	    					$("#idChk").css("color","#1DD816");
	    				}else{
	    					$("#idChk").text("해당 아이디는 사용중입니다.");
	    					$("#idChk").css("color","#FF0000");
	    				}
	    			}
	    		})    			
    		}else{
    			//정규표현식 불만족
    			$("#idChk").text("영문 소문자+숫자 조합 8~12자 아이디를 입력해 주세요.");
				$("#idChk").css("color","#FF0000");
    		}
    	})
    	$(".info-wrap input[name=userPw]").on("change",function(){
			const regPw = $(this).val();
    		
    		let regExp;
    		regExp = /^[a-z0-9!@#$-]{8,20}$/;
    		
    		if(regExp.test(regPw)){
    			$("#pwChk").text("사용 가능한 비밀번호입니다.");
				$("#pwChk").css("color","#1DD816");
				pwChk();
    		}else{
    			$("#pwChk").text("영문 소문자+숫자+특수문자(!@#$-) 조합 8~20자 비밀번호를 입력해 주세요.");
				$("#pwChk").css("color","#FF0000");
    		}
    	});
    	$(".info-wrap input[name=userPwRe]").on("change",function(){
    		pwChk();
    	});
    	
    	function pwChk(){
    		const userPw = $(".info-wrap input[name=userPw]").val();
    		const userPwRe = $(".info-wrap input[name=userPwRe]").val();
    		
    		if(userPw==userPwRe){
    			$("#pwChkRe").text("비밀번호가 일치합니다.");
				$("#pwChkRe").css("color","#1DD816");
    		}else {
    			$("#pwChkRe").text("비밀번호와 비밀번호 확인이 일치해야 합니다.");
				$("#pwChkRe").css("color","#FF0000");
    		}
    	}
    	
    	$("select[name=emailDomain]").on("change",function(){
    		const domain = $(this).val();
    		$(this).css("display","none");
    		const insertId = $("input[name=emailId]").val();
    		$("input[name=emailId]").css("display","none");
    		
    		$("input[name=userEmail]").css("display","block");
    		$("input[name=userEmail]").val(insertId+domain);    		
    	});
    	
    	$("input[name=userEmail]").on("change",function(){
    		const email = $(this).val();
    		if(!email.includes("@")){
    			$("input[name=emailId]").css("display","block");
    			$("select[name=emailDomain]").css("display","block");
    			$(this).css("display","none");
    		}
    	})
    	
    	let verifyCode;
		let intervalId;
    	
    	function verify(){
    		const receiver = $("input[name=userEmail]").val();
    		if(receiver==""){
    			alert("입력 내용을 확인해 주세요!");
    			return;
    		}else{
    			
        		let regExp;
        		regExp = /[@][a-zA-Z0-9]+[.]/;
    			
    			if(regExp.test(receiver)){
		    		$.ajax({
		    			url : "/sendIdChkEmail.do",
		    			data : { receiver : receiver },
		    			type : "post",
		    			success: function(data){
		    				// 인증코드 data로 받아오기
		    				verifyCode = data;
		    				console.log(verifyCode);
		    				$(".verify-wrap").removeClass("hidden");
		    				$(".verify-wrap").slideDown();
		    				
		    				// 제한시간 삽입
		    				let min = '3';
		    				let sec1 = '0';
		    				let sec2 = '0';
		    				$("#timeChk").text(min+":"+sec1+sec2);
		    				
		    				intervalId = setInterval(function(){
								if(sec2=='0'){
									sec2 = 9;
									
									if(sec1=='0'){
										sec1 = 5;
										min = min- 1;										

									}else{
										sec1 -= 1;
									}								
									
								}else{
									sec2 = sec2-1 ;
								}
								if(min=='0'&&sec1=='0'&&sec2=='0'){
									clearInterval(intervalId);
								}
								$("#timeChk").text(min+":"+sec1+sec2);
		    				},1000);
		    			}
		    		})    			    				
    			} else{
    				alert("이메일 형식을 확인해 주세요!");
    				return;
    			};
    		}
    	};
    	function codeChk(){
    		const insertCode = $("#emailVerify").val();
    		if(insertCode == verifyCode) {
    			$("#submitBtn").removeAttr("disabled");	
    			clearInterval(intervalId);
    			$("#timeChk").text("인증 완료!");
    			$("#timeChk").css("color","#1DD816");
    		}
    	};
    </script>
</body>
</html>