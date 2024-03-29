module SharedAboutScreen
  def verify_screen_ui
    super
    ui = {
      header_label  => { visible: true, caption: 'About' },
      version_label => { visible: true, caption: { starts_with: app_version } },
      link_label    => { visible: true, caption: 'Go to the Sauce Labs website.' }
    }
    verify_ui_states(ui)
  end
end
