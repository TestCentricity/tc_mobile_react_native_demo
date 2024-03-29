module SharedProductScreen

  attr_accessor :sort_state

  def sorted_product_data
    products = []
    (1..product_grid.get_item_count).each do |item|
      product_data_source.find_product(item.to_s)
      products.push([ProductData.current.name, ProductData.current.price])
    end
    products = case @sort_state
               when :name_ascending
                 products.sort_by(&:first)
               when :name_descending
                 products.sort_by(&:first).reverse
               when :price_ascending
                 products.sort_by(&:last)
               when :price_descending
                 products.sort { |b, a| a[1] <=> b[1] }
               end
    sorted = []
    products.each do |item|
      sorted.push("#{item[0]} - $#{item[1]}")
    end
    sorted
  end

  def verify_screen_ui
    super

    ui = {
      header_label => {
        visible: true,
        caption: 'Products'
      },
      sort_button => {
        visible: true,
        enabled: true
      },
      sort_by_menu => { visible: false },
      store_item => { count: 6 },
      product_grid => {
        visible: true,
        itemcount: 6
      },
      product_grid_item => { items: sorted_product_data }
    }
    verify_ui_states(ui)
  end

  def choose_product_item(product_id)
    product_data_source.find_product(product_id)
    product_grid_item.set_list_index(product_grid, product_id)
    product_grid_item.click
  end

  def invoke_sort_menu
    sort_button.click
    sort_by_menu.wait_until_visible(5)
  end

  def verify_sort_menu
    invoke_sort_menu unless sort_by_menu.visible?
    sort_by_menu.verify_sort_menu(sort_by = @sort_state)
  end

  def sort_by(sort_mode)
    sort_mode = sort_mode.gsub(/\s+/, '_').downcase.to_sym if sort_mode.is_a?(String)
    invoke_sort_menu
    sort_by_menu.sort_by(sort_mode)
    @sort_state = sort_mode
  end
end
