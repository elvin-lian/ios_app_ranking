Given /^there is a user$/ do
  @user = User.create(app_key: 'foo')
  @user.update_column(:app_secret, 'app_secret')
end