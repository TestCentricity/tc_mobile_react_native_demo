class CartListItem < TestCentricity::ScreenSection
  include SharedCartListItem

  trait(:section_name)    { 'Cart List Item' }
  trait(:section_locator) { { xpath: '(//XCUIElementTypeOther[@name="product row"])' } }

  # Cart List Item UI elements
  labels  product_name:       { xpath: '//XCUIElementTypeStaticText[@name="product label"]' },
          product_price:      { xpath: '//XCUIElementTypeStaticText[@name="product price"]' },
          color_label:        { xpath: '//XCUIElementTypeStaticText[@name="Color:"]' },
          quantity_value:     { xpath: '//XCUIElementTypeOther[@name="counter amount"]' }
  image   :product_image,     { xpath: '//XCUIElementTypeImage' }
  buttons review_star_1:      { xpath: '//XCUIElementTypeOther[@name="review star 1"]' },
          review_star_2:      { xpath: '//XCUIElementTypeOther[@name="review star 2"]' },
          review_star_3:      { xpath: '//XCUIElementTypeOther[@name="review star 3"]' },
          review_star_4:      { xpath: '//XCUIElementTypeOther[@name="review star 4"]' },
          review_star_5:      { xpath: '//XCUIElementTypeOther[@name="review star 5"]' },
          minus_qty_button:   { xpath: '//XCUIElementTypeOther[@name="counter minus button"]' },
          plus_qty_button:    { xpath: '//XCUIElementTypeOther[@name="counter plus button"]' },
          black_color_button: { xpath: '//XCUIElementTypeOther[@name="black circle"]' },
          blue_color_button:  { xpath: '//XCUIElementTypeOther[@name="blue circle"]' },
          gray_color_button:  { xpath: '//XCUIElementTypeOther[@name="gray circle"]' },
          red_color_button:   { xpath: '//XCUIElementTypeOther[@name="red circle"]' },
          remove_item_button: { xpath: '//XCUIElementTypeOther[@name="remove item"]' }
end
