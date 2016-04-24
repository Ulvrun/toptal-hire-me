require 'watir'
require 'logger'

gem 'watir-webdriver'
gem 'cucumber'


Given(/^User navigates to Toptal$/) do

  @browser = Watir::Browser.new :chrome
  @browser.goto 'http://www.toptal.com/'

end

When(/^button 'Login' is clicked$/) do

  puts "Click 'Login' link on the Homepage"
  @browser.link(:text => 'Login').click

end

And(/^enter (\S+) into 'Email' text field$/) do |email|

  puts "Enter incorrect email into 'Email' text field"
  @browser.text_field(:id => 'user_email').set(email)

end

And(/^enter (\S+) into 'Password' text field$/) do |password|

  puts "Enter incorrect password into 'Password' text field"
  @browser.text_field(:id => 'user_password').set(password)

end

And(/^click 'Login' button$/) do

  puts "Click 'Login' button"
  @browser.button(:id => 'save_new_user').click

end

Then(/^error message 'Invalid email or password\.' is displayed$/) do

  if Watir::Wait.until { @browser.element(:xpath => "//div[@class='notification-message']").present? }

    @browser.element(:xpath => "//div[@class='notification-message']").value == 'Invalid email or password.'
    puts "'Invalid email or password.' is displayed as expected"

  else

    puts "'Invalid email or password.' is absent on the page!"

  end

end