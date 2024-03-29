module SharedWebPageViewerScreen
  def verify_screen_ui
    sleep(5)
    super if Environ.is_android?
    # switch to WebView context
    AppiumConnect.webview_context
    # verify Apple home page is loaded
    verify_ui_states(nav_bar => { visible: true })
    # return to native app context
    AppiumConnect.set_context('NATIVE_APP')
  end
end
