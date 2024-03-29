class AboutScreen < BaseRNDemoAppScreen
  include SharedAboutScreen

  trait(:screen_name)    { 'About' }
  trait(:screen_locator) { { accessibility_id: 'about screen' } }
  trait(:deep_link)      { 'about' }
  trait(:navigator)      { nav_menu.open_about }
  trait(:app_version)    { 'V.1.3.0-build 244' }

  # About screen UI elements
  labels version_label: { xpath: '//android.view.ViewGroup[@content-desc="about screen"]/android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView' },
         link_label:    { xpath: '//android.view.ViewGroup[@content-desc="about screen"]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView' }
end
