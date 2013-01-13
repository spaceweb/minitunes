# Add a declarative step here for populating the DB with User.

Given /(.+) is a follower of (.+)$/ do |follower_name, user_name|
    follower = User.find_by_name(follower_name)
    user = User.find_by_name(user_name)
    follower.friendships.create!(friend: user)
end
