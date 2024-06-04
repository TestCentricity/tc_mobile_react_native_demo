class CartListItem < TestCentricity::ScreenSection
  include SharedCartListItem

  trait(:section_name)    { 'Cart List Item' }
  trait(:section_locator) { { xpath: '(//XCUIElementTypeOther[@name="product row"])' } }

  # Cart List Item UI elements
  labels  product_name:       { predicate: 'name == "product label"' },
          product_price:      { predicate: 'name == "product price"' },
          color_label:        { predicate: 'name == "Color:"' },
          quantity_value:     { predicate: 'name == "counter amount"' }
  image   :product_image,     { xpath: '//XCUIElementTypeImage' }
  buttons review_star_1:      { predicate: 'name == "review star 1"' },
          review_star_2:      { predicate: 'name == "review star 2"' },
          review_star_3:      { predicate: 'name == "review star 3"' },
          review_star_4:      { predicate: 'name == "review star 4"' },
          review_star_5:      { predicate: 'name == "review star 5"' },
          minus_qty_button:   { predicate: 'name == "counter minus button"' },
          plus_qty_button:    { predicate: 'name == "counter plus button"' },
          black_color_button: { predicate: 'name == "black circle"' },
          blue_color_button:  { predicate: 'name == "blue circle"' },
          gray_color_button:  { predicate: 'name == "gray circle"' },
          red_color_button:   { predicate: 'name == "red circle"' },
          remove_item_button: { predicate: 'name == "remove item"' }
end
