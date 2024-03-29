include TestCentricity


Given(/^I have launched the SauceLabs My Demo app$/) do
  # activate the app
  AppiumConnect.activate_app
  # ensure Shopping Cart is empty
  empty_cart
  # load data for placeholder user
  user_data_source.find_user('placeholder')
end


Given(/^I am logged in to the SauceLabs My Demo app$/) do
  # activate the app
  AppiumConnect.activate_app
  # log in as a valid user
  user_data_source.find_user('valid_data')
  unless Environ.is_signed_in?
    empty_cart
    login
    Environ.set_signed_in(true)
  end
end


When(/^I enter user credentials with (.*)$/) do |creds|
  user_data_source.find_user(creds.gsub(/\s+/, '_').downcase)
  login_screen.login
end


Given(/^I have logged in a valid user$/) do
  user_data_source.find_user('valid_data')
  login
end


When(/^I (?:load|am on) the (.*) screen$/) do |screen_name|
  # find and load the specified target screen
  target_screen = ScreenManager.find_screen(screen_name)
  target_screen.load_screen
end


When(/^I (?:click|tap) the ([^\"]*) navigation menu item$/) do |screen_name|
  # find and navigate to the specified target screen
  target_screen = ScreenManager.find_screen(screen_name)
  target_screen.navigate_to
  ScreenManager.current_screen = target_screen
end


Then(/^I expect the (.*) screen to be correctly displayed$/) do |screen_name|
  # find and verify that the specified target screen is loaded
  target_screen = ScreenManager.find_screen(screen_name)
  target_screen.verify_screen_exists
  # verify that target screen is correctly displayed
  target_screen.verify_screen_ui
end


Then(/^I expect an error to be displayed due to (.*)$/) do |reason|
  ScreenManager.current_screen.verify_entry_error(reason)
end


When(/^I (.*) the popup request modal$/) do |action|
  ScreenManager.current_screen.modal_action(action)
end


Then(/^the popup request modal should( not)? be visible$/) do |negate|
  ScreenManager.current_screen.verify_modal_state(visible = !negate)
end


def empty_cart
  # ensure Shopping Cart is empty
  CartData.current = nil
  begin
    products_screen.wait_until_exists(2)
  rescue
    logout
    products_screen.load_screen
  end
  base_app_screen.clear_app_data
end

def login
  begin
    login_screen.load_screen
  rescue
    logout
  end
  login_screen.login
end

def logout
  ScreenManager.current_screen = base_app_screen if ScreenManager.current_screen.nil?
  ScreenManager.current_screen.invoke_nav_menu
  ScreenManager.current_screen.nav_menu.open_log_out
  ScreenManager.current_screen.modal_action('accept')
  login_screen.verify_screen_exists
end
