module SharedCheckoutCompleteScreen
  def verify_screen_ui
    super
    ui = {
      checkout_complete_label => {
        visible: true,
        caption: 'Checkout Complete'
      },
      pony_express_image => {
        visible: true,
        enabled: true
      },
      continue_button => {
        visible: true,
        enabled: true,
        caption: 'Continue Shopping'
      }
    }
    verify_ui_states(ui)
  end
end
