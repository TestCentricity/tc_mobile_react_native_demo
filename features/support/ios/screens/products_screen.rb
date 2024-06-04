class ProductsScreen < BaseRNDemoAppScreen
  include SharedProductScreen

  trait(:screen_name)    { 'Products' }
  trait(:screen_locator) { { accessibility_id: 'products screen' } }
  trait(:deep_link)      { 'store-overview' }

  # Products screen UI elements
  button  :sort_button,  { name: 'sort button'}
  element :store_item,   { predicate: 'name == "store item"' }
  list    :product_grid, { xpath: '(//XCUIElementTypeScrollView)[2]' }
  sections product_grid_item: ProductGridItem,
           sort_by_menu:      SortByMenu

  def initialize
    @sort_state = :name_ascending
    super
    # define the list item element for the Product list object
    list_elements = { list_item: { xpath: '(//XCUIElementTypeOther[@name="store item"])' } }
    product_grid.define_list_elements(list_elements)
    # associate the Product Grid Item indexed section object with the Product list object
    product_grid_item.set_list_index(product_grid)
  end
end
