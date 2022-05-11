<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	textarea{
		width:100%; height: 500px;
		resize: none;	
	}
	.agreebox{
		margin: 20px auto;
		text-align: center;
	}
	@media (hover: hover) and (pointer: fine) { 
		button{
			width: 60%;
			margin-top: 20px !important;
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
                <div class="policy-box">
                	<textarea class="form-control">
MyTwitterBookmark은(는) ｢개인정보 보호법｣ 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다. 
                		 
제1조(개인정보의 처리목적)
MyTwitterBookmark은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 ｢개인정보 보호법｣ 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다. 

1. 홈페이지 회원 가입 및 관리 
회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리 시 법정대리인의 동의여부 확인, 각종 고지․통지, 고충처리 목적으로 개인정보를 처리합니다. 

2. 재화 또는 서비스 제공 
물품배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제․정산, 채권추심을 목적으로 개인정보를 처리합니다. 

3. 고충처리 
민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리결과 통보의 목적으로 개인정보를 처리합니다. 

제2조(개인정보의 처리 및 보유기간)
① MyTwitterBookmark은(는) 법령에 따른 개인정보 보유․이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다. 
② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다. 
  1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴 시까지 
    다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료 시까지 
    1) 관계 법령 위반에 따른 수사․조사 등이 진행 중인 경우에는 해당 수사․조사 종료 시까지 
    2) 홈페이지 이용에 따른 채권․채무관계 잔존 시에는 해당 채권․채무관계 정산 시까지  
  2. 재화 또는 서비스 제공 : 재화․서비스 공급완료 및 요금결제․정산 완료시까지
    다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료 시까지 
    1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시․광고, 계약내용 및 이행 등 거래에 관한 기록 
       - 표시․광고에 관한 기록 : 6개월 
       - 계약 또는 청약철회, 대금결제, 재화 등의 공급기록 : 5년 
       - 소비자 불만 또는 분쟁처리에 관한 기록 : 3년 
    2)「통신비밀보호법」에 따른 통신사실확인자료 보관
      - 가입자 전기통신일시, 개시․종료시간, 상대방 가입자번호, 사용도수, 발신기지국 위치추적자료 : 1년 
      - 컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료 : 3개월
       
제5조(정보주체와 법정대리인의 권리․의무 및 행사방법)

① 정보주체는 MyTwitterBookmark에 대해 언제든지 개인정보 열람․정정․삭제․처리정지 요구 등의 권리를 행사할 수 있습니다.
② 제1항에 따른 권리 행사는 MyTwitterBookmark에 대해 개인정보보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며,  MyTwitterBookmark은(는) 이에 대해 지체없이 조치하겠습니다. 
③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다. 
④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다. 
⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다. 
⑥ MyTwitterBookmark은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다. 
 
제6조(처리하는 개인정보 항목) MyTwitterBookmark 은(는) 다음의 개인정보 항목을 처리하고 있습니다. 

 1. 홈페이지 회원 가입 및 관리 
   ․필수항목 : 아이디, 비밀번호, 닉네임, 이메일주소 
   ․선택항목 : 프로필사진

 2. 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다. 
   ․IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록 
                	</textarea>
                </div>
                <div class="agreebox">
	                <input type="checkbox" id="policyChk" class="form-check-input"><label for="policyChk" class="form-check-label">본 약관을 확인하였으며, 회원가입을 위한 정보 제공에 동의합니다. (필수)</label> 
	                <button class="btn btn-lg btn-primary" onclick="next()">NEXT</button>
                </div>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
    	function next(){
    		if($("#policyChk").prop("checked")==false){
    			alert("회원가입 약관에 동의해주세요!");
    		}else{
    			location.href="/joinStep2.do";
    		}
    	}
    </script>
</body>
</html>