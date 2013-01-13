FILTER = {
    setup: function() {
      if ($('#albums >tbody >tr').length > 20) {
        $('<br>' + '<input type="button" id="filter_albums" value="See less" class= "btn btn-primary"/>'
          ).insertAfter('#albums').click(FILTER.filter_albums);
      }
    },
    filter_albums: function () {
      $('#albums tbody tr').each(FILTER.seeLess);
    },
    seeLess: function () {
      if (! /^(\d|10)\.$/i.test($(this).find('td:nth-child(1)').text())) {
        $(this).hide();
        $('#filter_albums').replaceWith('<input type="button" id="filter_albums" value="See more" class= "btn btn-primary" onclick="FILTER.seeMore()"/>');
      }
    },
    seeMore: function () {
      $('#albums tbody tr').show();
      $('#filter_albums').remove();
      $(FILTER.setup);
    }
}
$(FILTER.setup); 