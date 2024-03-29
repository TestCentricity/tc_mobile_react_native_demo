

When(/^I (.*) the navigation menu$/) do |action|
  ScreenManager.current_screen.nav_menu_action(action)
end


When(/^I swipe (.*)$/) do |direction|
  direction = direction.downcase.to_sym
  distance = direction == :right ? 0.5 : 1
  ScreenManager.current_screen.swipe_gesture(direction, distance)
end


Then(/^I expect the navigation menu to be correctly displayed$/) do
  ScreenManager.current_screen.verify_nav_menu(state = :displayed)
end


Then(/^I expect the navigation menu to be hidden$/) do
  ScreenManager.current_screen.verify_nav_menu(state = :closed)
end


When(/^I enter the url for the Apple web site$/) do
  webview_screen.load_web_site
end


When(/^I choose to log out$/) do
  ScreenManager.current_screen.invoke_nav_menu
  ScreenManager.current_screen.nav_menu.open_log_out
end
