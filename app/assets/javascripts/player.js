PLAYERAjax = {
    setup: function() {
        $('<div id="videoSong"></div>').
            hide().
            appendTo($('body'));
        $('#songs a').click(PLAYERAjax.getVideoUrl);
    },
    getVideoUrl: function() {
        $.ajax({type: 'GET',
                url: $(this).attr('href'),
                timeout: 5000,
                success: PLAYERAjax.showVideoSong,
                error: function() { alert('Error!'); }
               });
        $('#songs a').removeAttr("id");
        $(this).attr('id','stop_button');
        return(false);
    },
    showVideoSong: function(data) {
        var oneFourth = Math.ceil($(window).width() / 4);
        $(STOPPlayer.setup);
        $('#videoSong').
            html(data).
            css({'left': 2*oneFourth, 'width': 3/2*oneFourth, 'top': 60}).
            show();
        return(false);
    },
}
$(PLAYERAjax.setup);