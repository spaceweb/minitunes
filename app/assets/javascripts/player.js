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
        $('#stop_button').replaceWith('<img alt="Play_icon" id="play_button" src="/assets/play_icon.png" />');
        $('#songs a img').removeAttr("id");
        $(this).find('img').replaceWith('<img alt="Stop_icon" id="stop_button" src="/assets/stop_icon.png" />');
        return(false);
    },
    showVideoSong: function(data) {
        var oneFourth = Math.ceil($(window).width() / 4);
        $(STOPPlayer.setup);
        $('#videoSong').
            html(data).
            css({'left': 2*oneFourth, 'width': 3/2*oneFourth, 'top': 1/4*oneFourth}).
            show();
        return(false);
    },
}
$(PLAYERAjax.setup);