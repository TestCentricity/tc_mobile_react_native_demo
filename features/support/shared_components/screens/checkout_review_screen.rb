module SharedCheckoutReviewScreen
  def define_deep_link
    "checkout-review-order/#{CartData.current.cart_items_deep_link}/default"
  end

  def verify_screen_ui
    item_str = CartData.current.total_quantity > 1 ? 'items' : 'item'
    total_price = CartData.current.total_price + CartData.current.delivery_price
    shipping_address = UserData.current.ship_address_1
    shipping_address = "#{shipping_address}, #{UserData.current.ship_address_2}" unless UserData.current.ship_address_2.nil?
    ui = {
      header_label => {
        visible: true,
        caption: 'Checkout'
      },
      review_order_label => {
        visible: true,
        caption: 'Review your order'
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
        caption: "$#{total_price.round(2)}"
      },
      cart_list => {
        visible: true,
        itemcount: CartData.current.num_items
      },
      cart_list_item => { items: CartData.current.order_items },
      delivery_addr_label => {
        visible: true,
        caption: 'Delivery Address'
      },
      customer_name_value => {
        visible: true,
        caption: UserData.current.full_name
      },
      ship_address => {
        visible: true,
        caption: shipping_address
      },
      ship_city_state => {
        visible: true,
        caption: "#{UserData.current.ship_city}, #{UserData.current.ship_state}"
      },
      ship_country_zip => {
        visible: true,
        caption: "#{UserData.current.ship_country}, #{UserData.current.ship_zip_code}"
      },
      pay_method_label => {
        visible: true,
        caption: 'Payment Method'
      },
      payee_value => {
        visible: true,
        caption: UserData.current.cardholder_name
      },
      card_num_value => {
        visible: true,
        caption: UserData.current.card_num
      },
      expiry_value => {
        visible: true,
        caption: "Exp: #{UserData.current.expiry}"
      },
      delivery_label => {
        visible: true,
        caption: 'DHL Standard Delivery'
      },
      delivery_charge => {
        visible: true,
        caption: "$#{CartData.current.delivery_price}"
      },
      delivery_eta => {
        visible: true,
        caption: 'Estimated to arrive within 3 weeks.'
      },
      place_order_button => {
        visible: true,
        enabled: true,
        caption: 'Place Order',
      }
    }

    billing_ui = if UserData.current.bill_state
                   billing_address = UserData.current.bill_address_1
                   billing_address = "#{billing_address}, #{UserData.current.bill_address_2}" unless UserData.current.bill_address_2.nil?
                   {
                     bill_address_label => {
                       visible: true,
                       caption: 'Billing Address'
                     },
                     bill_recipient => {
                       visible: true,
                       caption: UserData.current.bill_name
                     },
                     bill_address => {
                       visible: true,
                       caption: billing_address
                     },
                     bill_city_state => {
                       visible: true,
                       caption: "#{UserData.current.bill_city}, #{UserData.current.bill_state}"
                     },
                     bill_country_zip => {
                       visible: true,
                       caption: "#{UserData.current.bill_country}, #{UserData.current.bill_zip_code}"
                     }
                   }
                 else
                   {
                     bill_address_label => {
                       visible: true,
                       caption: 'Billing address is the same as shipping address'
                     }
                   }
                 end
    verify_ui_states(ui.merge(billing_ui), auto_scroll = true)
    super
  end

  def place_order
    CartData.current = nil
    place_order_button.tap
  end
end
