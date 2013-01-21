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
            $('#reviewspaginate').pajinate({
              items_per_page : 10,
              num_page_links_to_display : 5,
              abort_on_small_lists: true,
              item_container_id : '.alt_content',
              nav_panel_id : '.alt_page_navigation'
            });
        }else {
            $(".link-Login").click();
        }
        return(false);
    },
}
$(Comments.setup);
