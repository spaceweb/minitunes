$(document).ready(function (){
  $("#albums tr:gt(19)").hide();
})

ALBUMS_SHOW = {
    setup: function() {
      if ($('#albums >tbody >tr').length > 20) {
        $('<br>' + '<input type="button" id="show_albums" value="See more" class= "btn btn-primary"/>'
          ).insertAfter('#albums').click(ALBUMS_SHOW.show_albums);
      }
    },

    show_albums: function () {
      $('#albums tbody tr').show();
      $('#show_albums').remove();
    }
}
$(ALBUMS_SHOW.setup); 
 
