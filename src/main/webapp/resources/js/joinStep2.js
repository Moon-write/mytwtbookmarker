function enter(){
    console.log("버튼클릭");
    // 입력내용 확인
    // 1. 아이디가 제정신인가?
    if($("#idChk").css("color")!="rgb(29, 216, 22)"){
        console.log("여기");
        alert("아이디를 다시 확인해 주세요!");
        return false;
    }
    if($("#pwChk").css("color")!="rgb(29, 216, 22)"){
        console.log("여기2");
        alert("비밀번호를 다시 확인해 주세요!");
        return false;
    }
    if($("#pwChkRe").css("color")!="rgb(29, 216, 22)"){
        console.log("여3");
        alert("비밀번호를 다시 확인해 주세요!");
        return false;
    }
    if($("input[name=userName]").val()==""){
        console.log("여기43");
        alert("닉네임을 입력해주세요!");
        return false;
    }
    // 여기까지 왔으면 폼 제출
    return true;

};
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
function loadImg(f){
    if(f.files.length!=0 && f.files[0]!=0){ 
        // 파일이 있고, 배열 0번이 정상적인 파일이면(0이 아니면)
        const reader = new FileReader();
        reader.readAsDataURL(f.files[0]); // 선택한 파일의 경로를 가져온다

        // 읽기가 완료되면 onload이벤트 발생 > 위의 이벤트가 로드 다되면 실행
        reader.onload = function(e){
        $(".profilePicWindow").css("display","block");
        $("#img-view").attr("src",e.target.result); // src태그에 로드 된 파일경로(e)의 targetresult를 지정
        }
    } else {
        $("#img-view").attr("src",""); // 이미지가 없어졌으면 경로비우기
        $(".profilePicWindow").css("display","none");
    }
}
function cancelImg(){
    $("#labelUpload").replaceWith( $("#labelUpload").clone(true) );
    $("#img-view").attr("src","");
    $(".profilePicWindow").css("display","none");
}