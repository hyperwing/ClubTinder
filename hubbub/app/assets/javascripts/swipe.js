// File created 11/26/2019 by Leah Gillespie
// Code was originally in the swipe view in a script tag, moved here for greater accessibility
var name;
//swipey swipey left transition
$('.carousel-control-prev').on('click', function(e){
    e.preventDefault();
    name = $(".carousel-item.active h5").text();
    var currentIndex = parseInt($(".carousel-item.active").attr("value"));
    var currentSlide = $("div[value=\""+String(currentIndex)+"\"]");
    var wantedIndex = currentIndex + 1;
    var wantedSlide = $("div[value=\""+String(wantedIndex)+"\"]");
    currentSlide.parent().prepend(wantedSlide);
    $('#swipeCarousel').carousel('prev');
    currentSlide.attr("class", "carousel-item")
    wantedSlide.attr("class", "carousel-item active")
    setTimeout(function (e){
        $("div[value=\""+String(currentIndex)+"\"]").remove();
    },1000)
    if (wantedSlide.val() == undefined){
        $(".carousel-inner").html('<h4 class="finished-matches">Match limit reached.</h4></br><h4 class="finished-matches">Be sure to check out your matches!</h4>');
        $(this).remove();
        $('.carousel-control-next').remove();
    }
});

//swipey swipey right transition
$('.carousel-control-next').on('click', function(e){
    e.preventDefault();
    name = $(".carousel-item.active h5").text();
    var currentIndex = parseInt($(".carousel-item.active").attr("value"));
    var currentSlide = $("div[value=\""+String(currentIndex)+"\"]");
    var wantedIndex = currentIndex + 1;
    var wantedSlide = $("div[value=\""+String(wantedIndex)+"\"]");
    $('#swipeCarousel').carousel('next');
    currentSlide.attr("class", "carousel-item")
    wantedSlide.attr("class", "carousel-item active")
    setTimeout(function (e){
        $("div[value=\""+String(currentIndex)+"\"]").remove();
    },1000)
    if (wantedSlide.val() == undefined){
        $(".carousel-inner").html('<h4 class="finished-matches">Match limit reached.</h4></br><h4 class="finished-matches">Be sure to check out your matches!</h4>');
        $(this).remove();
        $('.carousel-control-prev').remove();
    }
});

//to send ajax request
$('#swipeCarousel').on('click', function (e) {
    var currentIndex = parseInt($(".carousel-item.active").attr("value"));
    var currentSlide = $("div[value=\""+String(currentIndex)+"\"]");
    var wantedIndex = currentIndex + 1;
    var wantedSlide = $("div[value=\""+String(wantedIndex)+"\"]");

    var pWidth = $(this).innerWidth();
    var x = e.pageX;

    //swipe left
    if(pWidth*.2 > x){
        $.ajax({
            url: "/club_matches/add_new",
            type: "POST",
            data: {
                matched:0,
                club_name:name
            },
            success: function(data) {}
        });
        //right swipe
    }else if (pWidth*.8 < x){
        $.ajax({
            url: "/club_matches/add_new",
            type: "POST",
            data: {
                matched:1,
                club_name:name
            },
            success: function(data) {}
        });
    }
})