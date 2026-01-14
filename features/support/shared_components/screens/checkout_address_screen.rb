module SharedCheckoutAddressScreen
  def verify_screen_ui
    super
    # use placeholder data if valid user has not entered shipping address data
    user_data_source.find_user('placeholder') unless Environ.portal_state == :checkout_step_1

    ui = {
      header_label => {
        visible: true,
        caption: 'Checkout'
      },
      ship_address_label => {
        visible: true,
        caption: 'Enter a shipping address'
      },
      full_name_label => {
        visible: true,
        caption: 'Full Name*'
      },
      full_name => {
        visible: true,
        enabled: true,
        placeholder: UserData.current.full_name
      },
      address1_label => {
        visible: true,
        caption: 'Address Line 1*'
      },
      ship_address_1 => {
        visible: true,
        enabled: true,
        placeholder: UserData.current.ship_address_1
      },
      address2_label => {
        visible: true,
        caption: 'Address Line 2'
      },
      ship_address_2 => {
        visible: true,
        enabled: true,
        placeholder: UserData.current.ship_address_2
      },
      city_label => {
        visible: true,
        caption: 'City*'
      },
      ship_city => {
        visible: true,
        enabled: true,
        placeholder: UserData.current.ship_city
      },
      state_label => {
        visible: true,
        caption: 'State/Region'
      },
      ship_state => {
        visible: true,
        enabled: true,
        placeholder: UserData.current.ship_state
      },
      zip_code_label => {
        visible: true,
        caption: 'Zip Code*'
      },
      ship_zip_code => {
        visible: true,
        enabled: true,
        placeholder: UserData.current.ship_zip_code
      },
      country_label => {
        visible: true,
        caption: 'Country*'
      },
      ship_country => {
        visible: true,
        enabled: true,
        placeholder: UserData.current.ship_country
      },
      to_payment_button => {
        visible: true,
        enabled: true,
        caption: 'To Payment'
      },
      full_name_error => { visible: false },
      address1_error => { visible: false },
      city_error => { visible: false },
      zip_error => { visible: false },
      country_error => { visible: false }
    }
    verify_ui_states(ui)
  end

  def enter_data
    populate_data_fields(UserData.current.attributes)
    # click on header to hide iOS keyboard which obscures the To Payment button
    header_label.click
    to_payment_button.tap
  end

  def verify_entry_error(reason)
    ui = case reason.gsub(/\s+/, '_').downcase.to_sym
         when :no_full_name
           {
             full_name_error => {
               visible: true,
               caption: 'Please provide your full name.'
             }
           }
         when :no_delivery_address
           {
             address1_error => {
               visible: true,
               caption: 'Please provide your address.'
             }
           }
         when :no_delivery_city
           {
             city_error => {
               visible: true,
               caption: 'Please provide your city.'
             }
           }
         when :no_delivery_zip_code
           {
             zip_error => {
               visible: true,
               caption: 'Please provide your zip code.'
             }
           }
         when :no_delivery_country
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
