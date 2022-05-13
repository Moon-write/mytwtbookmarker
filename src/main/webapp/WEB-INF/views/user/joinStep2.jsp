<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../../../resources/css/joinStep2.css" rel="stylesheet">
</head>
<body>    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <content>
        <div class="div-content">
            <div class="div1-box">
                <div class="title">회원가입</div>
                <div class="info-wrap">
                	<form action="/joinUser.do" method="post" enctype="multipart/form-data">
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
           				
           				
           				
						<label for="profilePic">프로필 사진</label>
						<label for="labelUpload"><div class="btn btn-sm btn-primary">업로드</div></label>
						<div class="btn btn-sm btn-secondary" onclick="cancelImg(); return false;">취소</div>
						<input type="file" id="labelUpload" onchange="loadImg(this); return false;" accept=".jpg,.png,.jpeg" style="display: none;" name="upPic">
						<div class="profilePicWindow"><img id="img-view"></div>
						
					</div>
					<div class="agreebox"> 
						<input type="submit" id="submitBtn" class="btn btn-lg btn-primary" onclick="return enter();" disabled value="회원가입">
					</div>
				</form>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="/resources/js/joinStep2.js"></script>
</body>
</html>