# Shopping Cart data sourcing object
class CartDataSource < TestCentricity::DataSource
  def load_cart(num_items)
    node_name = num_items > 1 ? "#{num_items.to_s}_items" : "#{num_items.to_s}_item"
    CartData.current = CartData.new(environs.read('Cart_data', node_name))
  end

  def map_cart_data(cart_data)
    CartData.current = CartData.new(cart_data)
  end
end


# Shopping Cart data presenter object
class CartData < TestCentricity::DataPresenter
  attribute :cart_items_deep_link, String
  attribute :num_items, Integer
  attribute :total_quantity, Integer
  attribute :total_price, Float
  attribute :delivery_price, Float
  attribute :cart_items, Array
  attribute :order_items, Array

  def product_ids
    ids = []
    products = cart_items_deep_link.split(',')
    products.each do |item|
      ids.push(item.string_between('id=', '&'))
    end
    ids
  end
end
