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
        return(false);
    },
    showVideoSong: function(data) {
        $('#videoSong').
            html(data).
            css({'left': 603, 'top': 80}).
            show();
        return(false);
    },
}
$(PLAYERAjax.setup);