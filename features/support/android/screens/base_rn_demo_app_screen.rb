class BaseRNDemoAppScreen < TestCentricity::ScreenObject
  include SharedBaseRNDemoAppScreen

  trait(:screen_name) { 'Base App Screen' }

  # Base App screen UI elements
  element :header_image, { accessibility_id: 'longpress reset app' }
  buttons menu_button:   { accessibility_id: 'open menu' },
          cart_button:   { accessibility_id: 'cart badge' }
  labels  header_label:  { xpath: '//android.view.ViewGroup[@content-desc="container header"]/android.widget.TextView' },
          cart_quantity: { xpath: '//android.view.ViewGroup[@content-desc="cart badge"]/android.widget.TextView' }
  alerts  grant_modal:   { id: 'com.android.permissioncontroller:id/grant_dialog' },
          alert_modal:   { id: 'android:id/parentPanel' }
  section :nav_menu, NavMenu

  def verify_screen_ui
    ui = {
      menu_button => {
        visible: true,
        enabled: true
      },
      cart_button => {
        visible: true,
        enabled: true
      }
    }
    ui[cart_quantity] = if CartData.current.nil?
                          { visible: false }
                        else
                          {
                            visible: true,
                            caption: CartData.current.total_quantity.to_s
                          }
                        end
    verify_ui_states(ui)
  end

  def invoke_nav_menu
    menu_button.click
    sleep(1)
    nav_menu.wait_until_visible(3)
  end

  def open_cart
    cart_button.click
  end
end
