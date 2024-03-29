class CheckoutReviewScreen < BaseRNDemoAppScreen
  include SharedCheckoutReviewScreen

  trait(:screen_name)    { 'Checkout - Review' }
  trait(:screen_locator) { { accessibility_id: 'checkout review order screen' } }
  trait(:deep_link)      { define_deep_link }

  # Checkout Review screen UI elements
  labels  review_order_label:  { xpath: '//android.widget.ScrollView[@content-desc="checkout review order screen"]/android.view.ViewGroup/android.widget.TextView' },
          total_label:         { xpath: '//android.view.ViewGroup[@content-desc="checkout footer"]/android.widget.TextView[1]'},
          total_qty_value:     { accessibility_id: 'total number' },
          total_price_value:   { accessibility_id: 'total price' },
          delivery_addr_label: { xpath: '//android.view.ViewGroup[@content-desc="checkout delivery address"]/android.widget.TextView[1]' },
          customer_name_value: { xpath: '//android.view.ViewGroup[@content-desc="checkout delivery address"]/android.widget.TextView[2]' },
          ship_address:        { xpath: '//android.view.ViewGroup[@content-desc="checkout delivery address"]/android.widget.TextView[3]' },
          ship_city_state:     { xpath: '//android.view.ViewGroup[@content-desc="checkout delivery address"]/android.widget.TextView[4]' },
          ship_country_zip:    { xpath: '//android.view.ViewGroup[@content-desc="checkout delivery address"]/android.widget.TextView[5]' },
          pay_method_label:    { xpath: '//android.view.ViewGroup[@content-desc="checkout payment info"]/android.widget.TextView[1]' },
          payee_value:         { xpath: '//android.view.ViewGroup[@content-desc="checkout payment info"]/android.widget.TextView[2]' },
          card_num_value:      { xpath: '//android.view.ViewGroup[@content-desc="checkout payment info"]/android.widget.TextView[3]' },
          expiry_value:        { xpath: '//android.view.ViewGroup[@content-desc="checkout payment info"]/android.widget.TextView[4]' },
          bill_address_label:  { xpath: '//android.view.ViewGroup[@content-desc="checkout billing address"]/android.widget.TextView[1]' },
          bill_recipient:      { xpath: '//android.view.ViewGroup[@content-desc="checkout billing address"]/android.widget.TextView[2]' },
          bill_address:        { xpath: '//android.view.ViewGroup[@content-desc="checkout billing address"]/android.widget.TextView[3]' },
          bill_city_state:     { xpath: '//android.view.ViewGroup[@content-desc="checkout billing address"]/android.widget.TextView[4]' },
          bill_country_zip:    { xpath: '//android.view.ViewGroup[@content-desc="checkout billing address"]/android.widget.TextView[5]' },
          delivery_label:      { xpath: '//android.view.ViewGroup[@content-desc="checkout delivery details"]/android.widget.TextView[1]' },
          delivery_charge:     { xpath: '//android.view.ViewGroup[@content-desc="checkout delivery details"]/android.widget.TextView[2]' },
          delivery_eta:        { xpath: '//android.view.ViewGroup[@content-desc="checkout delivery details"]/android.widget.TextView[3]' }
  list    :cart_list,          { xpath: '//android.widget.ScrollView[@content-desc="checkout review order screen"]/android.view.ViewGroup' }
  button  :place_order_button, { accessibility_id: 'Place Order button' }
  section :cart_list_item, CartListItem

  def initialize
    super
    # define the list item element for the Cart list object
    list_elements = { list_item: { xpath: '//android.view.ViewGroup[@content-desc="product row"]' } }
    cart_list.define_list_elements(list_elements)
    # associate the Cart List Item indexed section object with the Cart list object
    cart_list_item.set_list_index(cart_list)
  end
end
