<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .keywordBadge{
        background-color: #1d9bf0;
        color: white;
        border-radius: 15px;
        padding: 4px 10px;
        margin: 0 2px;
        font-size: 0.7em;
        font-weight: 900;
	}
	.list-keyword{
        margin-top: 20px;
        width: 100%;
    }

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<input type="hidden" id="listNo" value="${list.listNo}">
    <content>
        <div class="div-content">
            <div class="div1-box">
				<div class="title">
					${list.listName }
				</div>
			    <div class="list-keyword keyword-box">
					<div class="keywordList">
						<span class='keywordBadge'>전체</span>
						<c:forEach items="${list.listKeyword }" var="k" varStatus="i">
                            <span class='keywordBadge'>${k }</span>
						</c:forEach>
                   	</div>
               	</div>
               	<hr>
               	<div class="list-content">
               	</div>
            </div>
        </div>
    </content>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script type="text/javascript">
    	$(function(){
    		loadTwt(0);
    	})
    	$(document).on("click",".keywordBadge",function(){
    		$(this).addClass("select");
    		loadTwt(1);
    	})
    	
    	function loadTwt(index){
   			const listNo = $("input#listNo").val();
    		if(index==0){
    			// 전체 로딩
    			$.ajax({
    				url : "/getListBookmarks.do",
    				data : {
    					listNo : listNo
    				},
    				success : function(list){
    					console.log(list);
    					if(list==null) {
    						return;
    					}
    					
    					for(let i=0;i<list.length;i++){
    						$(".list-content").append(list[i].markLink);
    					}
    				}
    			})
    			
    		}else{
    			const listNos = $(".select");
				let keyword = new Array();
				
				$(".list-content").empty();
				
    			for(let i=0;i<listNos.length;i++){
    				keyword.push(listNos[i].innerText);
    				console.log(keyword);
    			}
    			$.ajax({
    				url : "/getListKBookmarks.do",
    				data : {
    					listNo : listNo,
    					keyword : keyword
    				},
    				dataType : "json",
    				type : "post",
    				success : function(list){

    					for(let i=0;i<list.length;i++){
	    					showTwt(list[i].markLink);    						
    					}
    		}
    	});
    	
    </script>
</body>
</html>