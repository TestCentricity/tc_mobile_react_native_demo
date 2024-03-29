class QRCodeScannerScreen < BaseRNDemoAppScreen
  trait(:screen_name)    { 'QR Code Scanner' }
  trait(:screen_locator) { { accessibility_id: 'qr code screen' } }
  trait(:deep_link)      { 'qr-code-scanner' }
  trait(:navigator)      { nav_menu.open_qr_code_scanner }

  def verify_screen_exists
    modal_action(:accept)
    super
  end

  def verify_screen_ui
    super
    verify_ui_states(header_label => { visible: true, caption: 'QR Code Scanner' })
  end
end
