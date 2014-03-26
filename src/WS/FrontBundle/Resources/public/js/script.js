(function($){
    // Side submenu sliding
    $('.side-nav .arrow').click(function(){
        $(this).parent().find('.sub-nav').animate({ height: 'toggle', opacity: 'toggle', paddingLeft: 'toggle'}, 200);
        return false;
    });
    $('.side-nav .sub-nav').each(function(){
        if (!$(this).parent().find('.arrow').hasClass('active')) {
            $(this).attr('data-height', $(this).height()).css({'overflow':'hidden', 'paddingLeft':5}).animate({ height: 'toggle', opacity: 'toggle', 'marginLeft':'toggle'}, 0);
        }
    });

    // Feedback form
    $('#feedback-form').submit(function () {
        $.post('{{ ajaxUrl }}', $(this).serialize());
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
})(jQuery);
