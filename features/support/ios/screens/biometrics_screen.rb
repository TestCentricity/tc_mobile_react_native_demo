class BiometricsScreen < BaseRNDemoAppScreen
  trait(:screen_name)    { 'Biometrics' }
  trait(:screen_locator) { { accessibility_id: 'biometrics screen' } }
  trait(:navigator)      { nav_menu.open_biometrics }

  attr_accessor :auth_state

  # Biometrics screen UI elements
  switch :face_id_switch, { accessibility_id: 'biometrics switch'}

  def initialize
    super
    @auth_state = false
  end

  def verify_screen_ui
    super
    ui = {
      header_label => {
        visible: true,
        caption: 'FaceID'
      },
      face_id_switch => {
        visible: true,
        enabled: false,
        checked: false
      }
    }
    verify_ui_states(ui)
  end

  def biometric_auth(state)
    face_id_switch.set_switch_state(state)
    @auth_state = state
    # accept alert that requests Face ID authorization
    alert_modal.await_and_respond(:accept, timeout = 3)
    face_id_request.click if face_id_request.wait_until_visible(2, post_exception = false)
  end

  def verify_biometric_capable(state)
    ui = {
      face_id_switch => {
        visible: true,
        enabled: state,
        checked: false
      }
    }
    verify_ui_states(ui)
  end
end
