
window.followBtn;
window.unfollowBtn;
FollowUser = {
  setupFollow: function() {
    $('.follow').one("click", function(event) {
      event.preventDefault();
      followBtn = $(this);
      unfollowBtn = $('.unfollow[friend_id='+followBtn.attr('friend_id')+']');
      $.ajax({
        url: '/friendships/create',
        data: { friend_id: followBtn.attr('friend_id') },
        type: 'POST',
        success: FollowUser.toggleFollow
      });
      return(false);
    })
  },
  setupUnFollow: function() {
    $('.unfollow').one("click", function(event) {
      event.preventDefault();
      unfollowBtn = $(this);
      followBtn = $('.follow[friend_id='+unfollowBtn.attr('friend_id')+']');
      $.ajax({
        url: '/friendships/destroy',
        data: { friend_id: unfollowBtn.attr('friend_id') },
        type: 'DELETE',
        success: FollowUser.toggleUnFollow
      });
      return(false);
    })
  },
  toggleFollow: function(data) {
    followBtn.hide();
    unfollowBtn.show();
    return(false);
  },
  toggleUnFollow: function(data) {
    followBtn.show();
    unfollowBtn.hide();
    return(false);
  }
}
$(FollowUser.setupFollow);
$(FollowUser.setupUnFollow);
