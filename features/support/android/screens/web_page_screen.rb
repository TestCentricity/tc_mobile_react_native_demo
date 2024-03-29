class WebPageViewerScreen < BaseRNDemoAppScreen
  include SharedWebPageViewerScreen

  trait(:screen_name)    { 'Web Page Viewer' }
  trait(:screen_locator) { { accessibility_id: 'webview screen' } }

  # Apple Web Page UI elements
  elements nav_bar: { xpath: '//nav[@id="globalnav"]' },
           footer:  { xpath: '//footer[@id="globalfooter"]' }
end
