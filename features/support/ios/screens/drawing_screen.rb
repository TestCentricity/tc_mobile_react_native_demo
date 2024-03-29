class DrawingScreen < BaseRNDemoAppScreen
  include SharedDrawingScreen

  trait(:screen_name)    { 'Drawing' }
  trait(:screen_locator) { { accessibility_id: 'drawing screen' } }
  trait(:deep_link)      { 'drawing' }
  trait(:navigator)      { nav_menu.open_drawing }

  # Drawing screen UI elements
  buttons clear_button: { accessibility_id: 'Clear button'},
          save_button:  { accessibility_id: 'Save button'}
  element :drawing_pad, { accessibility_id: 'Signature Pad demo'}

  def modal_action(action)
    alert_modal.await_and_respond(action, timeout = 1)
    alert_modal.await_and_respond(action, timeout = 1)
  end
end
