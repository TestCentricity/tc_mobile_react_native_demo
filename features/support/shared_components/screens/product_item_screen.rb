module SharedProductItemScreen
  def define_deep_link
    "product-details/#{ProductData.current.id.to_s}"
  end

  def verify_screen_ui
    super
    ui = {
      header_label => {
        visible: true,
        caption: ProductData.current.name
      },
      price_value => {
        visible: true,
        caption: "$#{ProductData.current.price}"
      },
      highlights_label => {
        visible: true,
        caption: 'Product Highlights'
      },
      description_value => {
        visible: true,
        caption: ProductData.current.description
      },
      product_image => {
        visible: true,
        enabled: true
      },
      black_color_button => { visible: ProductData.current.colors.include?('BLACK') },
      blue_color_button => { visible: ProductData.current.colors.include?('BLUE') },
      gray_color_button => { visible: ProductData.current.colors.include?('GRAY') },
      red_color_button => { visible: ProductData.current.colors.include?('RED') },
      minus_qty_button => {
        visible: true,
        enabled: true
      },
      quantity_value => {
        visible: true,
        enabled: true,
        caption: ProductData.current.quantity.to_s
      },
      plus_qty_button => {
        visible: true,
        enabled: true
      },
      add_to_cart_button => {
        visible: true,
        enabled: ProductData.current.quantity > 0,
        caption: 'Add To Cart'
      }
    }
    verify_ui_states(ui)
  end

  def select_color(color)
    case color.downcase.to_sym
    when :black
      black_color_button.click
    when :blue
      blue_color_button.click
    when :red
      red_color_button.click
    when :gray
      gray_color_button.click
    end
    ProductData.current.chosen_color = color.to_s.upcase
  end

  def select_quantity(qty)
    if qty.zero?
      minus_qty_button.click
    else
      qty - 1.times do
        plus_qty_button.click
      end
    end
    ProductData.current.quantity = qty
  end

  def add_to_cart
    ProductData.current.chosen_color = ProductData.current.default_color if ProductData.current.chosen_color.nil?
    add_to_cart_button.click
    cart_data = {
      num_items: 1,
      total_quantity: ProductData.current.quantity,
      total_price: ProductData.current.price * ProductData.current.quantity,
      cart_items: "#{ProductData.current.quantity} - #{ProductData.current.name} - $#{ProductData.current.price} - #{ProductData.current.chosen_color}"
    }
    cart_data_source.map_cart_data(cart_data)
  end
end
