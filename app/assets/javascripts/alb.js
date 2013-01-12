ALB = {
    setup: function() {
        $('<label for="filter" class="explanation">' +
          '</label>' +
          '<input type="button" id="filter" value="TOP 20" class= "btn btn-primary"/>'
         ).insertAfter('#albums').click(ALB.filter_albums);
    },
    
    filter_albums: function () {
      $('#albums tbody tr').each(ALB.top_20);       
    },
    
    top_20: function () {
      if (! /^(\d|1\d|20)\.$/i.test($(this).find('td:nth-child(1)').text())) {
        $(this).hide();
      }
    }
}
$(ALB.setup); 