class SauceBotScreen < BaseRNDemoAppScreen
  include SharedSauceBotScreen

  trait(:screen_name)    { 'SauceBot Video' }
  trait(:screen_locator) { { accessibility_id: 'SauceBot screen' } }
  trait(:navigator)      { nav_menu.open_saucebot_video }

  # SauceBot Video screen UI elements
  element :video_player, { accessibility_id: 'YouTube Video Player' }
  buttons video_back:    { accessibility_id: 'video icon backward' },
          video_play:    { accessibility_id: 'video icon play' },
          video_pause:   { accessibility_id: 'video icon stop' },
          video_forward: { accessibility_id: 'video icon forward' },
          video_volume:  { accessibility_id: 'video icon volume-up' },
          video_mute:    { accessibility_id: 'video icon volume-mute' }
end
