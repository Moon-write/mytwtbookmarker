<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    .listBadge{
        background-color: #e3e3e3;
        border-radius: 15px;
        padding: 4px 10px;
        margin: 0 2px;
        font-size: 0.7em;
        font-weight: 900;
		color : black;        
	}
	.listBadge-checked{
        background-color: #1d9bf0;
        color: white;
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
	.keywordBadge-selected{
		background-color: #f5a9a9;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <content>
        <div class="div-content">
            <div class="div1-box">
				<div class="title">새 북마크 등록</div>
				
					<div class="newBookmark-info">
						<label class="form-label">리스트 선택</label>
						<div class="list-wrap">
							<c:forEach items="${list }" var="l">
								<label><span class="listBadge">${l.listName }</span><input type="checkbox" value="${l.listNo }" name="listNos" style="display:none;"></label>
							</c:forEach>
						</div>						
					
						<label class="form-label">북마크 키워드 설정</label>
						<div class="keyword-box">
							<div class="keywordList">
							</div>
							<input type="hidden" name="selectKeyword" id="keywordSelect">
						</div>
												
						<label for="markLink" class="form-label">북마크 링크</label>
						<input type="text" name="markLink" class="form-control" id="markLink">
						
						<label for="markDetail" class="form-label">북마크 설명</label>
						<input type="text" name="markDetail" class="form-control" id="markDetail">
						
					</div>
					
					</div>
					<input type="submit" class="btn btn-outline-primary">북마크 만들기</input><button id="backBtn" class="btn btn-outline-secondary">돌아가기</button>
				</form>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
    	let selectedKeyword = new Array();
    	
    	$("input[type=checkbox]").on("click",function(){
    		$(this).prev("span").toggleClass("listBadge-checked");
    		
    		if($(this).prop("checked")==true){
    			const listName = $(this).prev("span").text(); 
	    		$.ajax({
	    			url: "/getListKeyword.do",
	    			data : {
	    				listNo : $(this).val()
	    			},
	    			success : function(list){
	    				for(let i=0;i<list.length;i++){
	    					const div = $("<span class='keywordBadge'>");
	    					div.append(listName +' : '+list[i]);
	    					$(".keywordList").append(div);
	    				}
	    			}
	    		})    			
    		}else{
    			const listName = $(this).prev("span").text(); 
				const keywordList = $("span.keywordBadge:contains("+listName+")");
				keywordList.remove();
    		}    		
    	})
    	
    	$(document).on("click","span.keywordBadge",function(){
    		const keyword = $(this).text();
    		if($(this).hasClass("keywordBadge-selected")){
    			// 이미선택됨
				$(this).removeClass("keywordBadge-selected");
    			selectedKeyword.splice(selectedKeyword.indexOf(keyword),1);
    		}else{
    			// 선택안됨
	    		$(this).addClass("keywordBadge-selected");
	    		selectedKeyword.push(keyword);
    		}
    		
    	})
    </script>
</body>
</html>