class BaseRNDemoAppScreen < TestCentricity::ScreenObject
  include SharedBaseRNDemoAppScreen

  trait(:screen_name) { 'Base App Screen' }

  # Base App screen UI elements
  image    :header_image,    { accessibility_id: 'longpress reset app' }
  label    :header_label,    { accessibility_id: 'container header' }
  alert    :alert_modal,     { class: 'XCUIElementTypeAlert' }
  element  :face_id_request, { accessibility_id: 'AppSwitcherContentView' }
  sections nav_bar:  NavBar,
           nav_menu: NavMenu

  def navigate_to
    face_id_request.click if face_id_request.visible?
    super
  end

  def verify_screen_exists
    modal_action(:accept)
    face_id_request.click if face_id_request.visible?
    super
  end

  def verify_screen_ui
    nav_bar.verify_ui
  end

  def invoke_nav_menu
    nav_bar.open_menu
    sleep(1)
    nav_menu.wait_until_visible(3)
  end

  def verify_face_id_request
    # accept alert that requests Face ID authorization
    alert_modal.await_and_respond(:accept, timeout = 3)
    # wait for Face ID request
    face_id_request.wait_until_visible(5)
  end

  def verify_face_id_unrecognized
    ui = {
      alert_modal => {
        visible: true,
        caption: ['Face Not Recognized', 'Try Again']
      }
    }
    verify_ui_states(ui)
  end
end
