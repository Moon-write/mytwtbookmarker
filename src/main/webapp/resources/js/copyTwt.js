$("input[name=markLink]").on("change",function(){
    twtInit();
    // 입력된 링크
    const copiedlink = $(this).val();
    const paramIndex = copiedlink.lastIndexOf("?");
    let link;
    if(paramIndex>0){
        link = copiedlink.subString(0,paramIndex);
    }else{
        link = copiedlink;
    }
    
    $(".gotolink").attr("href",link);

    const part = link.split("/");
    // 링크 분해
    // 3번: 작성자ID , 5번: 트윗id
    $(".preview-twt").slideDown();
    $(".preview-twt").css("display","flex");

    $(".content-id").text("@"+part[3]);
    
    // 트윗내용 불러오기
    loadTwt(part[5], 1);
});

function twtInit(){
    $(".content-id").html("");
    $(".content-text").html("");
    $(".content-date").html("");
    $(".videoBadge").text("");
    $(".media-wrap").html("");
    $(".media-wrap").removeClass("pic-two");
    $(".media-wrap").removeClass("pic-three");
    $(".media-wrap").removeClass("pic-four");
    $("a.gotolink").attr("href","/");
    $(".preview-twt").slideUp();
}


function twtLoadError(){
    $(".content-text").html("<b>트윗 로드 실패!</b><br>링크 오류 혹은 비공개 계정이거나,<br>현재 접근이 제한된 아이디일 수 있습니다.");
    $(".content-date").html("");
    $(".media-wrap").html("");
}

function loadTwt(id, round){
    $.ajax({
        url: "/twt.do",
        method: "post",
        dataType : "JSON",
        data : {
            "ids" : id
        },
        success : function(result){      
            console.log(result);
            if(round==1){
                if(result.errors!=null){
                    twtLoadError();
                }            
                const text = result.data[0].text.replace('\n','<br>');
                
                $(".content-text").html(text);
                
                const date = result.data[0].created_at;
                const dateLine = date.substring(0,10);
                $(".content-date").append(dateLine);
            
                if(result.includes!=null){
                    const type =result.includes.media[0].type;
                    const length = result.includes.media.length;
                    let mediaTag = "";  
                    if(type=="photo"){
                        for(let i=0;i<result.includes.media.length;i++){
                            mediaTag = mediaTag + " <img class='mediaBox' src='"+result.includes.media[i].url+"'>";
                        }                    
                    }else if(type=="video"){
                        mediaTag = "<img class='mediaBox' src='"+result.includes.media[0].preview_image_url+"'>";
                        $(".videoBadge").text("play_circle");
                    }else if(type=="animated_gif"){
                        mediaTag = "<img class='mediaBox' src='"+result.includes.media[0].preview_image_url+"'>";
                        $(".videoBadge").text("gif_box");
                    }
                    $(".media-wrap").html(mediaTag);
            
                    if(length==2){
                        $(".media-wrap").addClass("pic-two");
                    }else if(length==3){
                        $(".media-wrap").addClass("pic-three");
                    }else if(length==4){
                        $(".media-wrap").addClass("pic-four");
                    } 
                }
                if(result.data[0].referenced_tweets!=null&&result.data[0].referenced_tweets[0].type=='quoted'){
                    loadTwt(result.data[0].referenced_tweets[0].id, 2);
                }               
            }else if(round==2){
                let quoteTag = "";
                if(result.errors!=null){
                    quoteTag = "<div class='quoteTwt'>삭제되었거나 비공개된 계정입니다!</div>";
                }else{
                    const text = result.data[0].text.replace('\n','<br>');
                    const date = result.data[0].created_at.substring(0,10);
                    // const dateLine = date.substring(0,10);
                    let mediaTag = "";

                    if(result.includes!=null){
                        const type = result.includes.media[0].type;
                        const length = result.includes.media.length;

                        if(type=="photo"){
                            for(let i=0;i<result.includes.media.length;i++){
                                mediaTag = mediaTag + " <img class='quoteTwt-media' src='"+result.includes.media[i].url+"'>";
                            }                    
                        }else if(type=="video"){
                            mediaTag = "<img class='quoteTwt-media' src='"+result.includes.media[0].preview_image_url+"'>"+"<span class='material-symbols-outlined quoteBadge'>play_circle</span>";
                        }else if(type=="animated_gif"){
                            mediaTag = "<img class='quoteTwt-media' src='"+result.includes.media[0].preview_image_url+"'>"+"<span class='material-symbols-outlined quoteBadge'>gif_box</span>";
                        }
                    }// 첨부미디어 있을때 조건문 마감
                    quoteTag = "<div class='quoteTwt'>"
                                    +"<div class='quoteTwt-text'>"
                                        +text
                                        +"<br><br><span class='quoteTwt-date'>"+date+"</span>"
                                    +"</div>"
                                    +"<div class='quoteTwt-media'>"
                                        +mediaTag
                                    +"</div>"
                                +"</div>";
                    $(".media-wrap").append(quoteTag);

                    if(length==2){
                        $(".quoteTwt-media").addClass("pic-two");
                    }else if(length==3){
                        $(".quoteTwt-media").addClass("pic-three");
                    }else if(length==4){
                        $(".quoteTwt-media").addClass("pic-four");
                    }
                }// 에러안나는 조건문 마감
            }            
        },
        error:function(){
            twtLoadError();
        }
    });
}

