Given /the following Users exist/ do |user_table|
  user_table.hashes.each do |user|
    User.create!(user)
  end
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  step %{I go to the Login page}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "user_password" with "#{password}"}
  step %{I press "Sign in"}
end