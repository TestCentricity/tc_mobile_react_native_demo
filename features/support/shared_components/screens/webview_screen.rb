module SharedWebViewScreen
  def verify_screen_ui
    super
    ui = {
      header_label => {
        visible: true,
        caption: 'Webview'
      },
      url_label => {
        visible: true,
        caption: 'URL'
      },
      url_field => {
        visible: true,
        enabled: true,
        placeholder: 'https://www.website.com'
      },
      go_to_site_button => {
        visible: true,
        enabled: true,
        caption: 'Go To Site'
      }
    }
    verify_ui_states(ui)
  end

  def load_web_site
    url_field.set('https://www.apple.com')
    go_to_site_button.click
    sleep(1)
    go_to_site_button.click if go_to_site_button.visible?
    self.wait_until_gone(5)
  end
end
