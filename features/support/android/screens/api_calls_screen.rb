class ApiCallsScreen < BaseRNDemoAppScreen
  include SharedApiCallsScreen

  trait(:screen_name)    { 'API Calls' }
  trait(:screen_locator) { { accessibility_id: 'api calls screen' } }
  trait(:navigator)      { nav_menu.open_api_calls }

  # API Calls screen UI elements
  buttons eu_dc_button: { xpath: '//android.view.ViewGroup[@content-desc="api calls screen"]/android.view.ViewGroup[2]' },
          us_dc_button: { xpath: '//android.view.ViewGroup[@content-desc="api calls screen"]/android.view.ViewGroup[3]' },
          a401_button:  { xpath: '//android.view.ViewGroup[@content-desc="api calls screen"]/android.view.ViewGroup[4]' },
          a404_button:  { xpath: '//android.view.ViewGroup[@content-desc="api calls screen"]/android.view.ViewGroup[5]' }
end
