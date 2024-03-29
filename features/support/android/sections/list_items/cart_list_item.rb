class CartListItem < TestCentricity::ScreenSection
  include SharedCartListItem

  trait(:section_name)    { 'Cart List Item' }
  trait(:section_locator) { { xpath: '(//android.view.ViewGroup[@content-desc="product row"])' } }

  # Cart List Item UI elements
  labels  product_name:       { xpath: '//android.widget.TextView[@content-desc="product label"]' },
          product_price:      { xpath: '//android.widget.TextView[@content-desc="product price"]' },
          color_label:        { xpath: '//android.widget.TextView[3]' },
          quantity_value:     { xpath: '//android.view.ViewGroup[@content-desc="counter amount"]/android.widget.TextView' }
  image   :product_image,     { xpath: '//android.widget.ImageView' }
  buttons review_star_1:      { xpath: '//android.view.ViewGroup[@content-desc="review star 1"]' },
          review_star_2:      { xpath: '//android.view.ViewGroup[@content-desc="review star 2"]' },
          review_star_3:      { xpath: '//android.view.ViewGroup[@content-desc="review star 3"]' },
          review_star_4:      { xpath: '//android.view.ViewGroup[@content-desc="review star 4"]' },
          review_star_5:      { xpath: '//android.view.ViewGroup[@content-desc="review star 5"]' },
          minus_qty_button:   { xpath: '//android.view.ViewGroup[@content-desc="counter minus button"]' },
          plus_qty_button:    { xpath: '//android.view.ViewGroup[@content-desc="counter plus button"]' },
          black_color_button: { xpath: '//android.view.ViewGroup[@content-desc="black circle"]' },
          blue_color_button:  { xpath: '//android.view.ViewGroup[@content-desc="blue circle"]' },
          gray_color_button:  { xpath: '//android.view.ViewGroup[@content-desc="gray circle"]' },
          red_color_button:   { xpath: '//android.view.ViewGroup[@content-desc="red circle"]' },
          remove_item_button: { xpath: '//android.view.ViewGroup[@content-desc="remove item"]' }
end
