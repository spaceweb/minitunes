Comments = {
    setup: function() {
        $('<div id="ShowReviews"></div>').
            hide().
            appendTo($('body'));
        $("#NewReview").submit(Comments.getReview);
    },
    getReview: function() {
        $.ajax({type: 'POST',
                url: $(this).attr('action'),
                data: $(this).serialize(),
                success: Comments.showReview,
                error: function() { alert('Error!'); }
               });
        return(false);
    },
    showReview: function(data) {
        $('.Reviews').hide();
        $('#ShowReviews').
            html(data).
            css({'margin-left':200}).
            show();
        return(false);  
    },
}
$(Comments.setup);
