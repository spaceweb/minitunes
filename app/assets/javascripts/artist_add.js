
window.addBtn;
window.removeBtn;
AddArtist = {
  setupAdd: function() {
    $('.btn-add').one("click", function(event) {
      event.preventDefault();
      addBtn = $(this);
      removeBtn = $('.btn-remove[id='+addBtn.attr('id')+']');
      $.ajax({
        url: '/user_artist/create',
        data: { id: addBtn.attr('id') },
        type: 'POST',
        success: AddArtist.toggleAdd
      });
      return(false);
    })
  },
  setupRemove: function() {
    $('.btn-remove').one("click", function(event) {
      event.preventDefault();
      removeBtn = $(this);
      addBtn = $('.btn-add[id='+removeBtn.attr('id')+']');
      $.ajax({
        url: '/user_artist/destroy',
        data: { id: removeBtn.attr('id') },
        type: 'DELETE',
        success: AddArtist.toggleRemove
      });
      return(false);
    })
  },
  toggleAdd: function(data) {
    addBtn.hide();
    removeBtn.show();
    $(AddArtist.setupAdd);
  },
  toggleRemove: function(data) {
    addBtn.show();
    removeBtn.hide();
    $(AddArtist.setupRemove);
  }
}
$(AddArtist.setupAdd);
$(AddArtist.setupRemove);
