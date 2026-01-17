class CheckoutAddressScreen < BaseRNDemoAppScreen
  include SharedCheckoutAddressScreen

  trait(:screen_name)    { 'Checkout - Address' }
  trait(:screen_locator) { { accessibility_id: 'checkout address screen' } }
  trait(:deep_link)      { 'checkout-address' }

  # Checkout Address screen UI elements
  textfields full_name:          { accessibility_id: 'Full Name* input field' },
             ship_address_1:     { accessibility_id: 'Address Line 1* input field' },
             ship_address_2:     { accessibility_id: 'Address Line 2 input field' },
             ship_city:          { accessibility_id: 'City* input field' },
             ship_state:         { accessibility_id: 'State/Region input field' },
             ship_zip_code:      { accessibility_id: 'Zip Code* input field' },
             ship_country:       { accessibility_id: 'Country* input field' }
  labels     ship_address_label: { accessibility_id: 'Enter a shipping address' },
             full_name_label:    { accessibility_id: 'Full Name*' },
             address1_label:     { accessibility_id: 'Address Line 1*' },
             address2_label:     { accessibility_id: 'Address Line 2' },
             city_label:         { accessibility_id: 'City*' },
             state_label:        { accessibility_id: 'State/Region' },
             zip_code_label:     { accessibility_id: 'Zip Code*' },
             country_label:      { accessibility_id: 'Country*' },
             full_name_error:    { xpath: '//XCUIElementTypeOther[@name="Full Name*-error-message"]/XCUIElementTypeStaticText' },
             address1_error:     { xpath: '//XCUIElementTypeOther[@name="Address Line 1*-error-message"]/XCUIElementTypeStaticText' },
             city_error:         { xpath: '//XCUIElementTypeOther[@name="City*-error-message"]/XCUIElementTypeStaticText' },
             zip_error:          { xpath: '//XCUIElementTypeOther[@name="Zip Code*-error-message"]/XCUIElementTypeStaticText' },
             country_error:      { xpath: '//XCUIElementTypeOther[@name="Country*-error-message"]/XCUIElementTypeStaticText' }
  button     :to_payment_button, { accessibility_id: 'To Payment button' }
end
