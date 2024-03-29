class NavMenu < TestCentricity::ScreenSection
  include SharedNavMenu

  trait(:section_name)    { 'Nav Menu' }
  trait(:section_locator) { { xpath: '//android.widget.ScrollView/android.view.ViewGroup' } }

  # Nav Menu UI elements
  buttons close_button:        { accessibility_id: 'menu item catalog' },
          webview_button:      { accessibility_id: 'menu item webview' },
          qr_code_button:      { accessibility_id: 'menu item qr code scanner' },
          geo_location_button: { accessibility_id: 'menu item geo location' },
          drawing_button:      { accessibility_id: 'menu item drawing' },
          about_button:        { accessibility_id: 'menu item about' },
          reset_app_button:    { accessibility_id: 'menu item reset app' },
          biometrics_button:   { accessibility_id: 'menu item biometrics' },
          log_in_button:       { accessibility_id: 'menu item log in' },
          log_out_button:      { accessibility_id: 'menu item log out' },
          api_calls_button:    { accessibility_id: 'menu item api calls' },
          sauce_video_button:  { accessibility_id: 'menu item sauce bot video' }

  def verify_ui
    ui = {
      self => { visible: true },
      close_button => {
        visible: true,
        enabled: true
      },
      webview_button => {
        visible: true,
        enabled: true,
        caption: 'Webview'
      },
      qr_code_button => {
        visible: true,
        enabled: true,
        caption: 'QR Code Scanner'
      },
      geo_location_button => {
        visible: true,
        enabled: true,
        caption: 'Geo Location'
      },
      drawing_button => {
        visible: true,
        enabled: true,
        caption: 'Drawing'
      },
      about_button => {
        visible: true,
        enabled: true,
        caption: 'About'
      },
      reset_app_button => {
        visible: true,
        enabled: true,
        caption: 'Reset App State'
      },
      biometrics_button => {
        visible: true,
        enabled: true,
        caption: 'FingerPrint'
      },
      log_in_button => {
        visible: true,
        enabled: true,
        caption: 'Log In'
      },
      log_out_button => {
        visible: true,
        enabled: true,
        caption: 'Log Out'
      },
      api_calls_button => {
        visible: true,
        enabled: true,
        caption: 'Api Calls'
      },
      sauce_video_button => {
        visible: true,
        enabled: true,
        caption: 'Sauce Bot Video'
      }
    }
    verify_ui_states(ui)
  end
end
