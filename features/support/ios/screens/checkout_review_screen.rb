class CheckoutReviewScreen < BaseRNDemoAppScreen
  include SharedCheckoutReviewScreen

  trait(:screen_name)    { 'Checkout - Review' }
  trait(:screen_locator) { { accessibility_id: 'checkout review order screen' } }
  trait(:deep_link)      { define_deep_link }

  # Checkout Review screen UI elements
  labels  review_order_label:  { accessibility_id: 'Review your order' },
          total_label:         { accessibility_id: 'Total:'},
          total_qty_value:     { accessibility_id: 'total number' },
          total_price_value:   { accessibility_id: 'total price' },
          delivery_addr_label: { xpath: '//XCUIElementTypeOther[@name="checkout delivery address"]/XCUIElementTypeStaticText[1]' },
          customer_name_value: { xpath: '//XCUIElementTypeOther[@name="checkout delivery address"]/XCUIElementTypeStaticText[2]' },
          ship_address:        { xpath: '//XCUIElementTypeOther[@name="checkout delivery address"]/XCUIElementTypeStaticText[3]' },
          ship_city_state:     { xpath: '//XCUIElementTypeOther[@name="checkout delivery address"]/XCUIElementTypeStaticText[4]' },
          ship_country_zip:    { xpath: '//XCUIElementTypeOther[@name="checkout delivery address"]/XCUIElementTypeStaticText[5]' },
          pay_method_label:    { xpath: '//XCUIElementTypeOther[@name="checkout payment info"]/XCUIElementTypeStaticText[1]' },
          payee_value:         { xpath: '//XCUIElementTypeOther[@name="checkout payment info"]/XCUIElementTypeStaticText[2]' },
          card_num_value:      { xpath: '//XCUIElementTypeOther[@name="checkout payment info"]/XCUIElementTypeStaticText[3]' },
          expiry_value:        { xpath: '//XCUIElementTypeOther[@name="checkout payment info"]/XCUIElementTypeStaticText[4]' },
          bill_address_label:  { xpath: '//XCUIElementTypeOther[@name="checkout billing address"]/XCUIElementTypeStaticText[1]' },
          bill_recipient:      { xpath: '//XCUIElementTypeOther[@name="checkout billing address"]/XCUIElementTypeStaticText[2]' },
          bill_address:        { xpath: '//XCUIElementTypeOther[@name="checkout billing address"]/XCUIElementTypeStaticText[3]' },
          bill_city_state:     { xpath: '//XCUIElementTypeOther[@name="checkout billing address"]/XCUIElementTypeStaticText[4]' },
          bill_country_zip:    { xpath: '//XCUIElementTypeOther[@name="checkout billing address"]/XCUIElementTypeStaticText[5]' },
          delivery_label:      { xpath: '//XCUIElementTypeOther[@name="checkout delivery details"]/XCUIElementTypeOther/XCUIElementTypeStaticText[1]' },
          delivery_charge:     { xpath: '//XCUIElementTypeOther[@name="checkout delivery details"]/XCUIElementTypeOther/XCUIElementTypeStaticText[2]' },
          delivery_eta:        { xpath: '//XCUIElementTypeOther[@name="checkout delivery details"]/XCUIElementTypeStaticText' }
  list    :cart_list,          { xpath: '//XCUIElementTypeOther[@name="checkout review order screen"]/XCUIElementTypeScrollView' }
  button  :place_order_button, { accessibility_id: 'Place Order button' }
  section :cart_list_item, CartListItem

  def initialize
    super
    # define the list item element for the Cart list object
    list_elements = { list_item: { xpath: '//XCUIElementTypeOther[@name="product row"]' } }
    cart_list.define_list_elements(list_elements)
    # associate the Cart List Item indexed section object with the Cart list object
    cart_list_item.set_list_index(cart_list)
  end
end
