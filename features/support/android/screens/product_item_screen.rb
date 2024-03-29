class ProductItemScreen < BaseRNDemoAppScreen
  include SharedProductItemScreen

  trait(:screen_name)    { 'Product Item' }
  trait(:screen_locator) { { accessibility_id: 'product screen' } }
  trait(:deep_link)      { define_deep_link }

  # Product Item screen UI elements
  labels  price_value:        { accessibility_id: 'product price' },
          description_value:  { accessibility_id: 'product description' },
          quantity_value:     { accessibility_id: 'counter amount' },
          highlights_label:   { xpath: '//android.view.ViewGroup/android.widget.TextView[2]' }
  image   :product_image,     { xpath: '//android.view.ViewGroup/android.widget.ImageView' }
  buttons add_to_cart_button: { accessibility_id: 'Add To Cart button' },
          minus_qty_button:   { accessibility_id: 'counter minus button' },
          plus_qty_button:    { accessibility_id: 'counter plus button' },
          black_color_button: { accessibility_id: 'black circle' },
          blue_color_button:  { accessibility_id: 'blue circle' },
          gray_color_button:  { accessibility_id: 'gray circle' },
          red_color_button:   { accessibility_id: 'red circle' }
end
