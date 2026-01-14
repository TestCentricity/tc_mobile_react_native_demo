module SharedCheckoutPaymentScreen
  def verify_screen_ui
    super
    # use placeholder data if valid user has not entered payment data
    user_data_source.find_user('placeholder') unless Environ.portal_state == :checkout_step_2

    ui = {
      header_label => {
        visible: true,
        caption: 'Checkout'
      },
      payment_method_label => {
        visible: true,
        caption: 'Enter a payment method'
      },
      pay_descript_label => {
        visible: true,
        caption: 'You will not be charged until you review your purchase on the next screen.'
      },
      card_label => {
        visible: true,
        caption: 'Card'
      },
      payee_label => {
        visible: true,
        caption: 'Full Name*'
      },
      cardholder_name => {
        visible: true,
        enabled: true,
        placeholder: UserData.current.cardholder_name
      },
      card_num_label => {
        visible: true,
        caption: 'Card Number*'
      },
      card_num => {
        visible: true,
        enabled: true,
        placeholder: '3258 1265 7568 789'
      },
      expiry_label => {
        visible: true,
        caption: 'Expiration Date*'
      },
      expiry => {
        visible: true,
        enabled: true,
        placeholder: '03/25'
      },
      security_code_label => {
        visible: true,
        caption: 'Security Code*'
      },
      cvv => {
        visible: true,
        enabled: true,
        placeholder: UserData.current.cvv
      },
      bill_address_check => {
        visible: true,
        enabled: true,
        checked: false
      },
      checkbox_label => {
        visible: true,
        caption: 'My billing address is the same as my shipping address.'
      },
      bill_name => { visible: false },
      bill_address_1 => { visible: false },
      bill_address_2 => { visible: false },
      bill_city => { visible: false },
      bill_state => { visible: false },
      bill_zip_code => { visible: false },
      bill_country => { visible: false },
      review_order_button => {
        visible: true,
        enabled: true,
        caption: 'Review Order'
      },
      payee_error => { visible: false },
      card_num_error => { visible: false },
      expiry_error => { visible: false },
      security_code_error => { visible: false }
    }
    verify_ui_states(ui)
  end

  def enter_data
    fields = {
      cardholder_name => UserData.current.cardholder_name,
      card_num => UserData.current.card_num,
      expiry => UserData.current.expiry,
      cvv => UserData.current.cvv
    }
    populate_data_fields(fields)

    if UserData.current.bill_state
      # click on header to hide iOS keyboard which obscures the Billing Address checkbox
      header_label.click
      bill_address_check.click
      populate_data_fields(UserData.current.attributes)
    end
    # click to hide iOS keyboard which obscures the Review Order button
    checkbox_label.click
    review_order_button.tap
  end

  def verify_entry_error(reason)
    ui = case reason.gsub(/\s+/, '_').downcase.to_sym
         when :no_cardholder_name
           {
             payee_error => {
               visible: true,
               caption: 'Value looks invalid.'
             }
           }
         when :no_card_number, :invalid_card_number
           {
             card_num_error => {
               visible: true,
               caption: 'Value looks invalid.'
             }
           }
         when :no_expiration, :invalid_expiration
           {
             expiry_error => {
               visible: true,
               caption: 'Value looks invalid.'
             }
           }
         when :no_cvv
           {
             security_code_error => {
               visible: true,
               caption: 'Value looks invalid.'
             }
           }
         when :no_billing_name
           {
             recipient_error => {
               visible: true,
               caption: 'Please provide your full name.'
             }
           }
         when :no_billing_address
           {
             address_error => {
               visible: true,
               caption: 'Please provide your address.'
             }
           }
         when :no_billing_city
           {
             city_error => {
               visible: true,
               caption: 'Please provide your city.'
             }
           }
         when :no_billing_zip_code
           {
             zip_error => {
               visible: true,
               caption: 'Please provide your zip code.'
             }
           }
         when :no_billing_country
           {
             country_error => {
               visible: true,
               caption: 'Please provide your country.'
             }
           }
         else
           raise "#{reason} is not a valid selector"
         end
    verify_ui_states(ui)
  end
end
