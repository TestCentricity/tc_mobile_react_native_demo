class CheckoutPaymentScreen < BaseRNDemoAppScreen
  include SharedCheckoutPaymentScreen

  trait(:screen_name)    { 'Checkout - Payment' }
  trait(:screen_locator) { { accessibility_id: 'checkout payment screen' } }
  trait(:deep_link)      { 'checkout-payment' }

  # Checkout Payment screen UI elements
  textfields payee_name_field:     { xpath: '(//XCUIElementTypeTextField[@name="Full Name* input field"])[1]' },
             card_number_field:    { accessibility_id: 'Card Number* input field' },
             expiration_field:     { accessibility_id: 'Expiration Date* input field' },
             security_code_field:  { accessibility_id: 'Security Code* input field' },
             recipient_name_field: { xpath: '(//XCUIElementTypeTextField[@name="Full Name* input field"])[2]' },
             address1_field:       { accessibility_id: 'Address Line 1* input field' },
             address2_field:       { accessibility_id: 'Address Line 2 input field' },
             city_field:           { accessibility_id: 'City* input field' },
             state_field:          { accessibility_id: 'State/Region input field' },
             zip_code_field:       { accessibility_id: 'Zip Code* input field' },
             country_field:        { accessibility_id: 'Country* input field' }
  checkbox   :bill_address_check,  { xpath: '//XCUIElementTypeOther[contains(@name, "checkbox")]'}
  button     :review_order_button, { accessibility_id: 'Review Order button' }
  labels     payment_method_label: { accessibility_id: 'Enter a payment method' },
             pay_descript_label:   { accessibility_id: 'You will not be charged until you review your purchase on the next screen.' },
             card_label:           { xpath: '//XCUIElementTypeStaticText[@name="Card"]' },
             payee_label:          { xpath: '(//XCUIElementTypeStaticText[@name="Full Name*"])[1]' },
             card_num_label:       { accessibility_id: 'Card Number*' },
             expiry_label:         { accessibility_id: 'Expiration Date*' },
             security_code_label:  { accessibility_id: 'Security Code*' },
             checkbox_label:       { xpath: '//XCUIElementTypeStaticText[@name="My billing address is the same as my shipping address."]' },
             payee_error:          { xpath: '(//XCUIElementTypeOther[@name="Full Name*-error-message"])[1]/XCUIElementTypeStaticText' },
             card_num_error:       { xpath: '//XCUIElementTypeOther[@name="Card Number*-error-message"]/XCUIElementTypeStaticText' },
             expiry_error:         { xpath: '//XCUIElementTypeOther[@name="Expiration Date*-error-message"]/XCUIElementTypeStaticText' },
             security_code_error:  { xpath: '//XCUIElementTypeOther[@name="Security Code*-error-message"]/XCUIElementTypeStaticText' },
             recipient_error:      { xpath: '(//XCUIElementTypeOther[@name="Full Name*-error-message"])[2]/XCUIElementTypeStaticText' },
             address_error:        { xpath: '//XCUIElementTypeOther[@name="Address Line 1*-error-message"]/XCUIElementTypeStaticText' },
             city_error:           { xpath: '//XCUIElementTypeOther[@name="City*-error-message"]/XCUIElementTypeStaticText' },
             zip_error:            { xpath: '//XCUIElementTypeOther[@name="Zip Code*-error-message"]/XCUIElementTypeStaticText' },
             country_error:        { xpath: '//XCUIElementTypeOther[@name="Country*-error-message"]/XCUIElementTypeStaticText' }
end
