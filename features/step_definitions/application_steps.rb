
Given /^I am logged in as (.*)$/ do |email|
  step %{I go to the Login page}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "user_password" with "123456"}
  step %{I press "Sign in"}
end
