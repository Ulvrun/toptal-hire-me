require 'watir'
require 'logger'

gem 'watir-webdriver'
gem 'cucumber'


Given(/^User navigates to Toptal$/) do

  @browser = Watir::Browser.new :chrome
  @browser.goto 'http://www.toptal.com/'
  @user = User.new('johnsmith@gmail.com', 42)

end

When(/^button 'Login' is clicked$/) do

  puts "Click 'Login' link on the Homepage"
  @browser.link(:text => 'Login').click

end

And(/^enter into 'Email' text field$/) do

  puts "Enter incorrect email into 'Email' text field"
  @browser.text_field(:id => 'user_email').set('johnsmith@gmail.com')

end

And(/^enter into 'Password' text field$/) do

  puts "Enter incorrect password into 'Password' text field"
  @browser.text_field(:id => 'user_password').set(42)

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