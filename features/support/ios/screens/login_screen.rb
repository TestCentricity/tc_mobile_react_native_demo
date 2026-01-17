class LoginScreen < BaseRNDemoAppScreen
  include SharedLoginScreen

  trait(:screen_name)    { 'Login' }
  trait(:screen_locator) { { accessibility_id: 'login screen' } }
  trait(:deep_link)      { 'login' }
  trait(:navigator)      { nav_menu.open_log_in }

  # Login screen UI elements
  labels     username_label: { accessibility_id: 'Username'},
             password_label: { xpath: '(//XCUIElementTypeStaticText[@name="Password"])[1]'},
             username_error: { accessibility_id: 'Username-error-message' },
             password_error: { accessibility_id: 'Password-error-message' },
             generic_error:  { accessibility_id: 'generic-error-message' }
  textfields username:       { accessibility_id: 'Username input field' },
             password:       { accessibility_id: 'Password input field' }
  button     :login_button,  { accessibility_id: 'Login button' }
end
