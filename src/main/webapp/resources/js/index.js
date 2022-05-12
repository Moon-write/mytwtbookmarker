$("input[name=markLink]").on("change",function(){
    // 입력된 링크
    const link = $(this).val();

    const part = link.split("/");
    // 링크 분해
    // 3번: 작성자ID , 5번: 트윗id
    $(".preview-twt").slideDown();
    $(".preview-twt").css("display","flex");
    $(".content-id").text("@"+part[3]);
    // 트윗내용 불러오기
    $.ajax({
        url: "/twt.do",
        method: "post",
        dataType : "JSON",
        data : {
            "ids" : part[5]
        },
        success : function(result){
            console.log(result);
            const text = result.data[0].text;
            const textBr = text.replace('\n','<br>');
            
            $(".content-text").html(textBr);
            
            const date = result.data[0].created_at;
            const dateLine = date.substring(0,10)+"<a href='"+link+"' class='gotolink'>원본 보기</a>";
            $(".content-date").html(dateLine);
            
            if(result.includes!=null){
                const type =result.includes.media[0].type;
                let mediaTag = "";
    
                if(type=="photo"){
                    console.log(result.includes.media.length);
                    for(let i=0;i<result.includes.media.length;i++){
                        mediaTag = mediaTag + " <img class='mediaBox' src='"+result.includes.media[i].url+"'>";
                        console.log(mediaTag);
                    }
                    
                }else if(type=="video"){
                    mediaTag = "<img class='mediaBox' src='"+result.includes.media[0].preview_image_url+"'>";
                    $(".videoBadge").text("play_circle");
                }
                $(".media-wrap").html(mediaTag);
                
            }  
        }
    })

})

