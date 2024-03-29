class SortByMenu < TestCentricity::ScreenSection
  trait(:section_name)    { 'Sort By Menu' }
  trait(:section_locator) { { xpath: '//XCUIElementTypeWindow/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther' } }

  # Sort By Menu UI elements
  labels   sort_by_label:    { xpath: '//XCUIElementTypeStaticText[@name="Sort by:"]' },
           name_asc_label:   { xpath: '//XCUIElementTypeOther[@name="nameAsc"]/XCUIElementTypeOther[2]/XCUIElementTypeStaticText' },
           name_dsc_label:   { xpath: '//XCUIElementTypeOther[@name="nameDesc"]/XCUIElementTypeOther[2]/XCUIElementTypeStaticText' },
           price_asc_label:  { xpath: '//XCUIElementTypeOther[@name="priceAsc"]/XCUIElementTypeOther[2]/XCUIElementTypeStaticText' },
           price_dsc_label:  { xpath: '//XCUIElementTypeOther[@name="priceDesc"]/XCUIElementTypeOther[2]/XCUIElementTypeStaticText' }
  elements name_asc_select:  { xpath: '//XCUIElementTypeOther[@name="nameAsc"]/XCUIElementTypeOther[@name="active option"]' },
           name_dsc_select:  { xpath: '//XCUIElementTypeOther[@name="nameDesc"]/XCUIElementTypeOther[@name="active option"]' },
           price_asc_select: { xpath: '//XCUIElementTypeOther[@name="priceAsc"]/XCUIElementTypeOther[@name="active option"]' },
           price_dsc_select: { xpath: '//XCUIElementTypeOther[@name="priceDesc"]/XCUIElementTypeOther[@name="active option"]' }

  def verify_sort_menu(sort_by)
    ui = {
      self => {
        visible: true,
        enabled: true
      },
      sort_by_label => {
        visible: true,
        caption: 'Sort by:'
      },
      name_asc_label => {
        visible: true,
        caption: 'Name - Ascending'
      },
      name_asc_select => { visible: sort_by == :name_ascending },
      name_dsc_label => {
        visible: true,
        caption: 'Name - Descending'
      },
      name_dsc_select => { visible: sort_by == :name_descending },
      price_asc_label => {
        visible: true,
        caption: 'Price - Ascending'
      },
      price_asc_select => { visible: sort_by == :price_ascending },
      price_dsc_label => {
        visible: true,
        caption: 'Price - Descending'
      },
      price_dsc_select => { visible: sort_by == :price_descending }
    }
    verify_ui_states(ui)
  end

  def sort_by(sort_mode)
    obj = case sort_mode
          when :name_ascending
            name_asc_label
          when :name_descending
            name_dsc_label
          when :price_ascending
            price_asc_label
          when :price_descending
            price_dsc_label
          else
            raise "#{sort_mode} is not a valid selector"
          end
    obj.click
    self.wait_until_hidden(5)
  end
end
