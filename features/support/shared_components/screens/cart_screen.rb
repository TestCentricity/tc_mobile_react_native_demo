module SharedCartScreen
  def define_deep_link
    CartData.current.nil? ? 'cart' : "cart/#{CartData.current.cart_items_deep_link}"
  end

  def verify_screen_ui
    super
    ui = if CartData.current.nil?
           {
             header_label => {
               visible: true,
               caption: 'No Items'
             },
             go_shopping_button => {
               visible: true,
               enabled: true,
               caption: 'Go Shopping',
             },
             empty_cart_image => { visible: true },
             total_label => { visible: false },
             total_qty_value => { visible: false },
             total_price_value =>{ visible: false },
             checkout_button => { visible: false }
           }
         else
           item_str = CartData.current.total_quantity > 1 ? 'items' : 'item'
           {
             header_label => {
               visible: true,
               caption: 'My Cart'
             },
             total_label => {
               visible: true,
               caption: 'Total:'
             },
             total_qty_value => {
               visible: true,
               caption: "#{CartData.current.total_quantity} #{item_str}"
             },
             total_price_value => {
               visible: true,
               caption: "$#{CartData.current.total_price}"
             },
             checkout_button => {
               visible: true,
               enabled: true,
               caption: 'Proceed To Checkout',
             },
             cart_list => {
               visible: true,
               itemcount: CartData.current.num_items
             },
             cart_list_item => { items: CartData.current.cart_items },
             go_shopping_button => { visible: false }
           }
         end
    verify_ui_states(ui)
  end

  def select_quantity(qty)
    cart_list_item.set_list_index(cart_list, 1)
    cart_list_item.select_quantity(qty)
    CartData.current = nil if CartData.current.num_items.zero?
  end

  def remove_item
    cart_list_item.set_list_index(cart_list, 1)
    cart_list_item.remove_item
    CartData.current = nil if CartData.current.num_items.zero?
  end

  def checkout
    checkout_button.click
  end
end
