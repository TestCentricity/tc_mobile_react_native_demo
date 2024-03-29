module SharedNavMenu
  def close
    close_button.click
    self.wait_until_hidden(seconds = 3, post_exception = false)
    if close_button.visible?
      close_button.click
      self.wait_until_hidden(3)
    end
  end

  def verify_closed
    sleep(1)
    verify_ui_states(close_button => { visible: false })
  end

  def open_webview
    webview_button.click
  end

  def open_qr_code_scanner
    qr_code_button.click
  end

  def open_geo_location
    geo_location_button.click
  end

  def open_drawing
    drawing_button.click
  end

  def open_report_a_bug
    report_a_bug_button.click
  end

  def open_about
    about_button.click
  end

  def open_reset_app
    reset_app_button.click
  end

  def open_biometrics
    biometrics_button.click
  end

  def open_log_in
    log_in_button.click
  end

  def open_log_out
    log_out_button.click
  end

  def open_api_calls
    api_calls_button.click
  end

  def open_saucebot_video
    sauce_video_button.click
  end
end