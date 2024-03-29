class CheckoutCompleteScreen < BaseRNDemoAppScreen
  include SharedCheckoutCompleteScreen

  trait(:screen_name)    { 'Checkout - Complete' }
  trait(:screen_locator) { { accessibility_id: 'checkout complete screen' } }
  trait(:deep_link)      { 'checkout-complete' }

  # Checkout Complete screen UI elements
  labels checkout_complete_label: { accessibility_id: 'Checkout Complete' }
  image  :pony_express_image,     { xpath: '//XCUIElementTypeImage' }
  button :continue_button,        { accessibility_id: 'Continue Shopping button' }
end
