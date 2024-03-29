module SharedSauceBotScreen
  def verify_screen_ui
    super
    video_player.wait_until_visible(10)
    ui = {
      header_label => {
        visible: true,
        caption: 'SauceBot - The Beginning'
      },
      video_player => {
        visible: true,
        enabled: true
      },
      video_back => {
        visible: true,
        enabled: true
      },
      video_pause => {
        visible: true,
        enabled: true
      },
      video_play => { visible: false },
      video_forward => {
        visible: true,
        enabled: true
      },
      video_volume => {
        visible: true,
        enabled: true
      },
      video_mute => { visible: false }
    }
    verify_ui_states(ui)
  end
end
