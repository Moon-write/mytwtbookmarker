$("span.close-btn").on("click",function(){
    $(".modal-background").css("display","none");
})
$("span.login-btn").on("click",function(){
    $(".modal-background").css("display","flex");
})

$(".header-menu>div#profilePic").on("click",function(){
    $(".navi-menu").css("transition","1s").css("left","0px");
})
$(".navi-menu span.naviClose-btn").on("click",function(){
    $(".navi-menu").css("transition","1s").css("left","-100%");
})