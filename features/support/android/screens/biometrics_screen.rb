class BiometricsScreen < BaseRNDemoAppScreen
  trait(:screen_name)    { 'Biometrics' }
  trait(:screen_locator) { { accessibility_id: 'biometrics screen' } }
  trait(:navigator)      { nav_menu.open_biometrics }

  # Biometrics screen UI elements
  switch :fingerprint_switch, { accessibility_id: 'biometrics switch'}

  def verify_screen_ui
    super
    ui = {
      header_label => {
        visible: true,
        caption: 'FingerPrint'
      },
      fingerprint_switch => {
        visible: true,
        enabled: false
      }
    }
    verify_ui_states(ui)
  end
end
