class ProductGridItem < TestCentricity::ScreenSection
  trait(:section_name)    { 'Product Grid Item' }
  trait(:section_locator) { { xpath: '(//XCUIElementTypeOther[@name="store item"])' } }

  # Product Cell Item UI elements
  labels  product_name:  { xpath: '//XCUIElementTypeStaticText[@name="store item text"]' },
          product_price: { xpath: '//XCUIElementTypeStaticText[@name="store item price"]' }
  buttons review_star_1: { xpath: '//XCUIElementTypeOther[@name="review star 1"]' },
          review_star_2: { xpath: '//XCUIElementTypeOther[@name="review star 2"]' },
          review_star_3: { xpath: '//XCUIElementTypeOther[@name="review star 3"]' },
          review_star_4: { xpath: '//XCUIElementTypeOther[@name="review star 4"]' },
          review_star_5: { xpath: '//XCUIElementTypeOther[@name="review star 5"]' }

  def get_value
    product_price.scroll_into_view
    "#{product_name.get_caption} - #{product_price.get_caption}"
  end
end
