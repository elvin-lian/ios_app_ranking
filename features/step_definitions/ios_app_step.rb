Given /^there is a app with following data$/ do |table|
  @ios_app = IosApp.create!(table.hashes.first)
  instance_variable_set("@ios_app_#{table.hashes.first['track_id']}", @ios_app)
end
