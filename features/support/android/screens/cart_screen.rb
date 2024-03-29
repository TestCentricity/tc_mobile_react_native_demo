class CartScreen < BaseRNDemoAppScreen
  include SharedCartScreen

  trait(:screen_name)    { 'Cart' }
  trait(:screen_locator) { { accessibility_id: 'cart screen' } }
  trait(:deep_link)      { define_deep_link }

  # Cart screen UI elements
  image   :empty_cart_image,  { xpath: '//android.widget.ImageView' }
  list    :cart_list,         { xpath: '//android.widget.ScrollView[@content-desc="cart screen"]' }
  buttons go_shopping_button: { accessibility_id: 'Go Shopping button' },
          checkout_button:    { accessibility_id: 'Proceed To Checkout button' }
  labels  total_label:        { xpath: '//android.view.ViewGroup[@content-desc="checkout footer"]/android.widget.TextView[1]' },
          total_qty_value:    { accessibility_id: 'total number' },
          total_price_value:  { accessibility_id: 'total price' }
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
