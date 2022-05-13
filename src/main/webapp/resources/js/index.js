$("input[name=markLink]").on("change",function(){
    twtInit();
    // 입력된 링크
    const link = $(this).val();

    const part = link.split("/");
    // 링크 분해
    // 3번: 작성자ID , 5번: 트윗id
    $(".preview-twt").slideDown();
    $(".preview-twt").css("display","flex");

    $(".content-id").text("@"+part[3]);

    const dateLine = date.substring(0,10)+"<a href='"+link+"' class='gotolink' target='_new'>원본 보기</a>";
    $(".content-date").html(dateLine);
    // 트윗내용 불러오기
    loadTwt(part[5], 1);

});

function twtInit(){
    $(".content-id").html();
    $(".content-text").html("");
    $(".content-date").html("");
    $(".videoBadge").text("");
    $(".media-wrap").html("");
    $(".media-wrap").removeClass("pic-two");
    $(".media-wrap").removeClass("pic-three");
    $(".media-wrap").removeClass("pic-four");
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
            console.log("여기는?");
            console.log(result);        
            if(round==1){
                attachMedia(result);
            }else if(round==2){

            }
        },
        error:function(){
            twtLoadError();
        }
    })
}

function attachMedia(result){

    if(result.errors!=null){
        twtLoadError();
    }

    const text = result.data[0].text.replace('\n','<br>');
    
    $(".content-text").html(text);
    
    const date = result.data[0].created_at;

    console.log("주목!!!"+result.data[0].referenced_tweets[0]);

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

    }else if(result.data[0].referenced_tweets[0].type=="quoted"){
        console.log("여기");
    }
}