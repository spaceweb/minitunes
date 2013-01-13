# Add a declarative step here for populating the DB with User.

Given /(.+) is a follower of (.+)$/ do |follower_name, user_name|
    follower = User.find_by_name(follower_name)
    user = User.find_by_name(user_name)
    follower.friendships.create!(friend: user)
end

Given /^me, (.+), I am following to (.+)$/ do |user_name, follower_name|
    follower = User.find_by_name(follower_name)
    user = User.find_by_name(user_name)
    user.friendships.create!(friend: follower)
end