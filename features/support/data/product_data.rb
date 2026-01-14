# Product data sourcing object
class ProductDataSource < TestCentricity::DataSource
  def find_product(product_id)
    ProductData.current = ProductData.new(environs.read('Products', product_id))
  end
end


# Product data presenter object
class ProductData < TestCentricity::DataPresenter
  attribute :id, Integer
  attribute :name, String
  attribute :description, String
  attribute :price, Float
  attribute :review, Integer
  attribute :colors, Array
  attribute :default_color, String
  attribute :chosen_color, String
  attribute :quantity, Integer

  def initialize(data)
    super
    @quantity = 1
    @chosen_color = nil
  end
end
