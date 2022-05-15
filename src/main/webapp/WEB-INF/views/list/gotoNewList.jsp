<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.keyword-box{
		position: relative;
	}
	.keywordList{
		position: absolute;
		left: 0px;
		top: 6px;
		display: flex;
	}
	.keywordBadge{
		background-color: #1d9bf0;
		color: white;
		border-radius: 15px;
		padding: 4px 10px;
		margin: 0 2px;
		font-size: 0.7em;
		font-weight: 900;
	}
	.form-control{
		margin-bottom: 50px;
	}
	form input#listOpen {
		margin-right: 4px;
	}
	form p{
		margin-top: 5px;
		margin-left: 20px;
		font-size: 0.9em;
	}
	.profilePicWindow{
		width: 100px;
	}
	.profilePicWindow>img{
		width: 100%;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <content>
        <div class="div-content">
            <div class="div1-box">
				<div class="title">새 리스트 등록</div>
				
					<div class="newList-info">
						<label for="listName" class="form-label">신규 리스트 이름</label>
						<input type="text" name="listName" class="form-control" id="listName">
						<label for="listKeyword" class="form-label">리스트 키워드 설정</label>
						<div class="keyword-box">
							<div class="keywordList"></div>
							<input type="text" class="form-control" id="listKeyword" placeholder="쉼표(,)로 키워드 구분" onkeyup="return keyupEvent();">
						</div>						
						<input type="checkbox" name="openList" id="listOpen" class="form-check-input" value="open"><label for="listOpen" class="form-check-label">공개 리스트 설정</label>
						<p>공개 리스트 설정 시 다른 유저가 회원님의 리스트를 탐색할 수 있습니다.</p>
					</div>
					<div class="newList-pic">
						<label for="profilePic">프로필 사진</label>
						<label for="labelUpload"><div class="btn btn-sm btn-primary">업로드</div></label>
						<div class="btn btn-sm btn-secondary" onclick="cancelImg(); return false;">취소</div>
						<input type="file" id="labelUpload" onchange="loadImg(this); return false;" accept=".jpg,.png,.jpeg" style="display: none;" name="upPic">
						<div class="profilePicWindow"><img id="img-view"></div>
						<input type="hidden" name="keyword" id="keywordInsert">
					</div>
					<button onclick="return insertKeyword();" class="btn btn-outline-primary">리스트 만들기</button><a href="/gotoList.do" class="btn btn-outline-secondary">돌아가기</a>
				</form>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		let keywordArray = new Array();
		$("input#listKeyword").on("blur",function(){
			const insert = $("input#listKeyword").val();
			let index = insert.length;
			
			if(index>0){
				checkInsert(index);				
			}
		})
		function keyupEvent(e){
			const insert = $("input#listKeyword").val();
			let index = insert.indexOf(",");
			
			if(window.event.keyCode==13){
				index = insert.length;
			}
			if(index>0){
				checkInsert(index);
			}
		}
		
		function checkInsert(index){
			const insert = $("input#listKeyword").val();			

			// 콤마가 있으면 분리
			const keyword = insert.substring(0,index);
			$("input#listKeyword").val(insert.substring(index+1));
			
			if(keywordArray.indexOf(keyword)==-1){
				keywordArray.push(keyword);
				
				const badge = $("<div class='keywordBadge'>");
				const close = $("<span class='material-symbols-outlined closeBadge' style='font-size:0.5em; margin-left:4px; font-weight:300;'>");
				close.text("close");
				
				badge.append(keyword);
				badge.append(close);
				
				$(".keywordList").append(badge);
				
				paddingsetting();
			}			
		}

		$(document).on("click",".closeBadge",function(){
			const badge = $(this).parent();
			const keyword = badge.text();
			
			const index = keywordArray.indexOf(keyword.substring(0,keyword.length-5));
			keywordArray.splice(index,1);
			badge.css("display","none");

			paddingsetting();
		});
		function paddingsetting(){
			const width = $(".keywordList").css("width")
			$("input#listKeyword").css("padding-left", "calc( "+width+" + 10px )");
		}

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

		function insertKeyword(){
			$("#keywordInsert").val(keywordArray);
			if($("#listName").val()==""){
				console.log("리스트 이름을 입력해주세요!");
				return false;
			}
			if(!confirm("리스트를 만드시겠습니까?")){
				return false;
			}
			const form = $("<form action='/insertNewList.do' method='post' enctype='multipart/form-data'>");

			$("body").append(form);
			
			form.append($("#listName"));
			form.append($("#listOpen"));
			form.append($("#keywordInsert"));
			form.append($("#labelUpload"));
			
			form.submit();			
		}
	</script>
</body>
</html>