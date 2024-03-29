class LoginScreen < BaseRNDemoAppScreen
  include SharedLoginScreen

  trait(:screen_name)    { 'Login' }
  trait(:screen_locator) { { accessibility_id: 'login screen' } }
  trait(:deep_link)      { 'login' }
  trait(:navigator)      { nav_menu.open_log_in }

  # Login screen UI elements
  labels     username_label: { xpath: '//android.view.ViewGroup[@content-desc="login screen"]/android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[2]'},
             password_label: { xpath: '//android.view.ViewGroup[@content-desc="login screen"]/android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[3]'},
             username_error: { accessibility_id: 'Username-error-message' },
             password_error: { accessibility_id: 'Password-error-message' },
             generic_error:  { accessibility_id: 'generic-error-message' }
  textfields username_field: { accessibility_id: 'Username input field' },
             password_field: { accessibility_id: 'Password input field' }
  button     :login_button,  { accessibility_id: 'Login button' }
end
