class ProductsScreen < BaseRNDemoAppScreen
  include SharedProductScreen

  trait(:screen_name)    { 'Products' }
  trait(:screen_locator) { { accessibility_id: 'products screen' } }
  trait(:deep_link)      { 'store-overview' }

  # Products screen UI elements
  button  :sort_button,  { accessibility_id: 'sort button'}
  element :store_item,   { xpath: '//android.view.ViewGroup[@content-desc="store item"]' }
  list    :product_grid, { xpath: '//android.widget.ScrollView/android.view.ViewGroup' }
  sections product_grid_item: ProductGridItem,
           sort_by_menu:      SortByMenu

  def initialize
    @sort_state = :name_ascending
    super
    # define the list item element for the Product list object
    list_elements = { list_item: { xpath: '//android.view.ViewGroup[@content-desc="store item"]' } }
    product_grid.define_list_elements(list_elements)
    # associate the Product Grid Item indexed section object with the Product list object
    product_grid_item.set_list_index(product_grid)
  end
end
