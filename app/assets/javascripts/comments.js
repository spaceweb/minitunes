Comments = {
    setup: function() {
        $("#NewReview").submit(Comments.getReview);
    },
    getReview: function() {
        $.ajax({type: 'POST',
                url: $(this).attr('action'),
                data: $(this).serialize(),
                success: Comments.showReview,
               });
        return(false);
    },
    showReview: function(data) {
        if (data.split("reviews-content").length > 1) {
            $(".reviews-content").children().remove();
            $(".reviews-content").append(data);
            $("#textareareviews").val('');
        }else {
            $(".link-Login").click();
        }
        return(false);
    },
}
$(Comments.setup);
