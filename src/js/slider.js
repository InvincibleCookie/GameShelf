new Swiper('.image-slider',{
    touchRadio: 1,

    touchAngle: 45,

    grabCursor: true,

    slideToClickedSlide: true,

    mousewheel: {
        sensitivity: 1,
        eventsTarget: ".image-slider"
    },

    slidesPerView: 5,

    spaceBetween: 10,

    centeredSlides: true,

    slidesPerGroup: 1,

    initialSlide: 2,

    loop: true,

    loopedSlides: 2,

    speed: 800,

//     effect: 'coverflow',

//     coverflowEffect: {
//     rotate: 0,
//     stretch: 50,
//     slideShadows: false,
//     },
});