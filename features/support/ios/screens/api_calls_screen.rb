class ApiCallsScreen < BaseRNDemoAppScreen
  include SharedApiCallsScreen

  trait(:screen_name)    { 'API Calls' }
  trait(:screen_locator) { { accessibility_id: 'api calls screen' } }
  trait(:navigator)      { nav_menu.open_api_calls }

  # API Calls screen UI elements
  buttons eu_dc_button: { accessibility_id: 'EU-DC' },
          us_dc_button: { accessibility_id: 'US-DC' },
          a401_button:  { accessibility_id: '401' },
          a404_button:  { accessibility_id: '404' }
end
