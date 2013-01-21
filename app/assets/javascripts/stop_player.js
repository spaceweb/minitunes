STOPPlayer = {
    setup: function() {
         $('#stop_button').click(STOPPlayer.getVideoUrl);
    },
    getVideoUrl: function () {
        $.ajax({type: 'GET',
                url: $(this).attr('href'),
                timeout: 5000,
                success: STOPPlayer.closeVideoSong,
                error: function() { alert('Error!'); }
               });
        return(false);
    },
    closeVideoSong: function(data) {
        $('#videoSong').remove();
        $('#stop_button').replaceWith('<img alt="Play_icon" id="play_button" src="/assets/play_icon.png" />');
        $(PLAYERAjax.setup);
        return(false);
    },
}
