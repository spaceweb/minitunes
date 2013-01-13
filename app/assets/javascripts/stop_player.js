STOPPlayer = {
   setup: function() {
        $('<img alt="Stop_icon" src="/assets/stop_icon.png" />'
         ).insertAfter('#songs a').click(STOPPlayer.closeVideoSong);
    },
    closeVideoSong: function () {
        $('#videoSong').remove();
        $(PLAYERAjax.setup);
    }
}
$(STOPPlayer.setup);