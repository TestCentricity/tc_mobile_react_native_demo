module SharedCartListItem
  def get_value
    if ScreenManager.current_screen == cart_screen
      remove_item_button.scroll_into_view
    else
      color_label.scroll_into_view
    end

    color = case
            when black_color_button.visible?
              'BLACK'
            when blue_color_button.visible?
              'BLUE'
            when gray_color_button.visible?
              'GRAY'
            when red_color_button.visible?
              'RED'
            end

    if ScreenManager.current_screen == cart_screen
      "#{quantity_value.get_caption} - #{product_name.get_caption} - #{product_price.get_caption} - #{color}"
    else
      "#{product_name.get_caption} - #{product_price.get_caption} - #{color}"
    end
  end

  def select_quantity(qty)
    if qty.zero?
      minus_qty_button.click
      CartData.current.num_items -= 1
      CartData.current.total_quantity -= 1
    else
      qty.times do
        break if quantity_value.caption == qty.to_s
        plus_qty_button.click
        sleep(1)
      end
      CartData.current.total_quantity = qty
    end
    ProductData.current.quantity = qty
  end

  def remove_item
    remove_item_button.scroll_into_view
    remove_item_button.click
    CartData.current.num_items -= 1
    CartData.current.total_quantity -= 1
    ProductData.current.quantity = 0
  end
end
