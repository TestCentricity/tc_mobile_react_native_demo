class AboutScreen < BaseRNDemoAppScreen
  include SharedAboutScreen

  trait(:screen_name)    { 'About' }
  trait(:screen_locator) { { accessibility_id: 'about screen' } }
  trait(:deep_link)      { 'about' }
  trait(:navigator)      { nav_menu.open_about }
  trait(:app_version)    { 'V.1.3.0-build 162' }

  # About screen UI elements
  labels version_label: { xpath: '//XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeStaticText' },
         link_label:    { accessibility_id: 'Go to the Sauce Labs website.' }
end
