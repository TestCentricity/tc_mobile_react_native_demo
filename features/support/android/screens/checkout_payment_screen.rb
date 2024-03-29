class CheckoutPaymentScreen < BaseRNDemoAppScreen
  include SharedCheckoutPaymentScreen

  trait(:screen_name)    { 'Checkout - Payment' }
  trait(:screen_locator) { { accessibility_id: 'checkout payment screen' } }
  trait(:deep_link)      { 'checkout-payment' }

  # Checkout Payment screen UI elements
  textfields payee_name_field:     { xpath: '(//android.widget.EditText[@content-desc="Full Name* input field"])[1]' },
             card_number_field:    { accessibility_id: 'Card Number* input field' },
             expiration_field:     { accessibility_id: 'Expiration Date* input field' },
             security_code_field:  { accessibility_id: 'Security Code* input field' },
             recipient_name_field: { xpath: '(//android.widget.EditText[@content-desc="Full Name* input field"])[2]' },
             address1_field:       { accessibility_id: 'Address Line 1* input field' },
             address2_field:       { accessibility_id: 'Address Line 2 input field' },
             city_field:           { accessibility_id: 'City* input field' },
             state_field:          { accessibility_id: 'State/Region input field' },
             zip_code_field:       { accessibility_id: 'Zip Code* input field' },
             country_field:        { accessibility_id: 'Country* input field' }
  checkbox   :bill_address_check,  { xpath: '//android.view.ViewGroup[contains(@content-desc, "checkbox")]/android.view.ViewGroup'}
  button     :review_order_button, { accessibility_id: 'Review Order button' }
  labels     payment_method_label: { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[1]' },
             pay_descript_label:   { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[2]' },
             card_label:           { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView' },
             payee_label:          { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[3]' },
             card_num_label:       { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[4]' },
             expiry_label:         { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[5]' },
             security_code_label:  { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[6]' },
             checkbox_label:       { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[7]' },
             payee_error:          { xpath: '//android.view.ViewGroup[@content-desc="Full Name*-error-message"]/android.widget.TextView' },
             card_num_error:       { xpath: '//android.view.ViewGroup[@content-desc="Card Number*-error-message"]/android.widget.TextView' },
             expiry_error:         { xpath: '//android.view.ViewGroup[@content-desc="Expiration Date*-error-message"]/android.widget.TextView' },
             security_code_error:  { xpath: '//android.view.ViewGroup[@content-desc="Security Code*-error-message"]/android.widget.TextView' },
             recipient_error:      { xpath: '//android.view.ViewGroup[@content-desc="Full Name*-error-message"]/android.widget.TextView' },
             address_error:        { xpath: '//android.view.ViewGroup[@content-desc="Address Line 1*-error-message"]/android.widget.TextView' },
             city_error:           { xpath: '//android.view.ViewGroup[@content-desc="City*-error-message"]/android.widget.TextView' },
             zip_error:            { xpath: '//android.view.ViewGroup[@content-desc="Zip Code*-error-message"]/android.widget.TextView' },
             country_error:        { xpath: '//android.view.ViewGroup[@content-desc="Country*-error-message"]/android.widget.TextView' }
end
