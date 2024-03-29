class NavBar < TestCentricity::ScreenSection
  trait(:section_name)    { 'Nav Bar' }
  trait(:section_locator) { { xpath: '//XCUIElementTypeOther[contains(@name, "Catalog, tab, 1 of 3")][1]' } }

  # Nav Bar UI elements
  buttons catalog_tab: { accessibility_id: 'tab bar option catalog' },
          cart_tab:    { accessibility_id: 'tab bar option cart' },
          menu_tab:    { accessibility_id: 'tab bar option menu' }

  def verify_ui
    cart_items = CartData.current.nil? ? '0' : CartData.current.total_quantity.to_s
    ui = {
      catalog_tab => {
        visible: true,
        enabled: true,
        caption: { starts_with: 'Catalog' }
      },
      cart_tab => {
        visible: true,
        enabled: true,
        caption: cart_items
      },
      menu_tab => {
        visible: true,
        enabled: true,
        caption: { starts_with: 'Menu' }
      }
    }
    verify_ui_states(ui)
  end

  def open_catalog
    catalog_tab.click
  end

  def open_cart
    cart_tab.click
  end

  def open_menu
    menu_tab.click
  end

  def cart_quantity
    cart_tab.caption.to_i
  end
end
