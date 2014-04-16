(function($){
    // Side submenu sliding
    var ani = { height: 'toggle', opacity: 'toggle', paddingLeft: 'toggle'};
    $('.side-nav .arrow').click(function(){
        $(this).parent().find('.sub-nav').add('.side-nav .sub-nav.open').animate(ani, 200).toggleClass('open');
        return false;
    });
    $('.side-nav .sub-nav').each(function(){
        if (!$(this).parent().find('.arrow').hasClass('active')) {
            $(this).attr('data-height', $(this).height()).css({'overflow':'hidden', 'paddingLeft':5}).animate(ani, 0);
        }
    });

    // Feedback form
    $('#feedback-form').submit(function () {
        $.post($(this).attr('data-url'), $(this).serialize());
        $('#feedback-window').trigger('closeModal');
        return false;
    });
    $('#feedback-window').easyModal({
        top: 180,
        overlayOpacity: 0.3,
        overlayColor: "#CCC",
        closeOnEscape: true
    });
    $('#make-order').on('click', function (e) {
        e.preventDefault();
        $('#feedback-window').trigger('openModal');
    });

    // Main items clicks
    $('.what-we-can.active').click(function(){
        $('.side-nav .' + $(this).attr('data-menu')).click();
        return false;
    });
})(jQuery);
