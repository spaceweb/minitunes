STOPPlayer = {
   setup: function() {
        $('#play_button').remove();
        $('<img alt="Stop_icon" id="play_button" src="/assets/stop_icon.png" />'
         ).insertAfter('#stop_button').click(STOPPlayer.closeVideoSong);
    },
    closeVideoSong: function () {
        $('#videoSong').remove();
        $('#play_button').remove();
        window.location.reload();
    }
}
