//= require nivo/jquery.nivo.slider.pack

(function (){
    $(document).ready(function() {
        $('#slider').nivoSlider({
            effect: 'fade', // Specify sets like: 'fold,fade,sliceDown'
            animSpeed: 500, // Slide transition speed
            pauseTime: 3000, // How long each slide will show
            directionNav: true, // Next & Prev navigation
            directionNavHide: true, // Only show on hover
            controlNav: true, // 1,2,3... navigation
            controlNavThumbs: false, // Use thumbnails for Control Nav
            controlNavThumbsFromRel: true, // Use image rel for thumbs
            keyboardNav: true, // Use left & right arrows
            pauseOnHover: true, // Stop animation while hovering
            manualAdvance: false, // Force manual transitions
            captionOpacity: 0.8, // Universal caption opacity
            prevText: 'Prev', // Prev directionNav text
            nextText: 'Next'
        });
    });
})();
