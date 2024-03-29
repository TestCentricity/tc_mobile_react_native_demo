class CheckoutAddressScreen < BaseRNDemoAppScreen
  include SharedCheckoutAddressScreen

  trait(:screen_name)    { 'Checkout - Address' }
  trait(:screen_locator) { { accessibility_id: 'checkout address screen' } }
  trait(:deep_link)      { 'checkout-address' }

  # Checkout Address screen UI elements
  textfields fullname_field:     { accessibility_id: 'Full Name* input field' },
             address1_field:     { accessibility_id: 'Address Line 1* input field' },
             address2_field:     { accessibility_id: 'Address Line 2 input field' },
             city_field:         { accessibility_id: 'City* input field' },
             state_field:        { accessibility_id: 'State/Region input field' },
             zip_code_field:     { accessibility_id: 'Zip Code* input field' },
             country_field:      { accessibility_id: 'Country* input field' }
  labels     ship_address_label: { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[1]' },
             full_name_label:    { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[2]' },
             address1_label:     { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[3]' },
             address2_label:     { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[4]' },
             city_label:         { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[5]' },
             state_label:        { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[6]' },
             zip_code_label:     { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[7]' },
             country_label:      { xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.widget.TextView[8]' },
             full_name_error:    { xpath: '//android.view.ViewGroup[@content-desc="Full Name*-error-message"]/android.widget.TextView' },
             address1_error:     { xpath: '//android.view.ViewGroup[@content-desc="Address Line 1*-error-message"]/android.widget.TextView' },
             city_error:         { xpath: '//android.view.ViewGroup[@content-desc="City*-error-message"]/android.widget.TextView' },
             zip_error:          { xpath: '//android.view.ViewGroup[@content-desc="Zip Code*-error-message"]/android.widget.TextView' },
             country_error:      { xpath: '//android.view.ViewGroup[@content-desc="Country*-error-message"]/android.widget.TextView' }
  button     :to_payment_button, { accessibility_id: 'To Payment button' }
end
