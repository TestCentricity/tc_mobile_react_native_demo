class SortByMenu < TestCentricity::ScreenSection
  trait(:section_name)    { 'Sort By Menu' }
  trait(:section_locator) { { xpath: '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup' } }

  # Sort By Menu UI elements
  labels   sort_by_label:    { xpath: '//android.widget.TextView' },
           name_asc_label:   { xpath: '//android.view.ViewGroup[@content-desc="nameAsc"]/android.widget.TextView' },
           name_dsc_label:   { xpath: '//android.view.ViewGroup[@content-desc="nameDesc"]/android.widget.TextView[2]' },
           price_asc_label:  { xpath: '//android.view.ViewGroup[@content-desc="priceAsc"]/android.widget.TextView[2]' },
           price_dsc_label:  { xpath: '//android.view.ViewGroup[@content-desc="priceDesc"]/android.widget.TextView[2]' }
  elements name_asc_select:  { xpath: '//android.view.ViewGroup[@content-desc="nameAsc"]/android.view.ViewGroup[@content-desc="active option"]' },
           name_dsc_select:  { xpath: '//android.view.ViewGroup[@content-desc="nameDesc"]/android.view.ViewGroup[@content-desc="active option"]' },
           price_asc_select: { xpath: '//android.view.ViewGroup[@content-desc="priceAsc"]/android.view.ViewGroup[@content-desc="active option"]' },
           price_dsc_select: { xpath: '//android.view.ViewGroup[@content-desc="priceDesc"]/android.view.ViewGroup[@content-desc="active option"]' }

  def verify_sort_menu(sort_by)
    if sort_by == :name_ascending
      ui = {
        name_asc_label => {
          visible: true,
          caption: 'Name - Ascending'
        },
        name_dsc_label => {
          visible: true,
          caption: 'Name - Descending'
        },
        price_asc_label => {
          visible: true,
          caption: 'Price - Ascending'
        },
        price_dsc_label => {
          visible: true,
          caption: 'Price - Descending'
        }
      }
      verify_ui_states(ui)
    end

    ui = {
      self => {
        visible: true,
        enabled: true
      },
      sort_by_label => {
        visible: true,
        caption: 'Sort by:'
      },
      name_asc_select => { visible: sort_by == :name_ascending },
      name_dsc_select => { visible: sort_by == :name_descending },
      price_asc_select => { visible: sort_by == :price_ascending },
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
