module SharedApiCallsScreen
  def verify_screen_ui
    a404_button.click
    ui = {
      header_label => {
        visible: true,
        caption: 'API calls'
      },
      eu_dc_button => {
        enabled: true,
        visible: true,
        caption: 'EU-DC'
      },
      us_dc_button => {
        enabled: true,
        visible: true,
        caption: 'US-DC'
      },
      a401_button => {
        enabled: true,
        visible: true,
        caption: '401'
      },
      a404_button => {
        enabled: true,
        visible: true,
        caption: '404'
      },
    }
    verify_ui_states(ui)
  end
end
