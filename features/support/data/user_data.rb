# User data sourcing object
class UserDataSource < TestCentricity::DataSource
  def find_user(node_name)
    options = { keys_as_symbols: true }
    UserData.current = UserData.new(environs.read('User_creds', node_name, options))
  end
end


# User data presenter object
class UserData < TestCentricity::DataPresenter
  attribute :username, String
  attribute :password, String
  attribute :full_name, String
  attribute :ship_address_1, String
  attribute :ship_address_2, String
  attribute :ship_city, String
  attribute :ship_state, String
  attribute :ship_zip_code, String
  attribute :ship_country, String
  attribute :cardholder_name, String
  attribute :card_num, String
  attribute :expiry, String
  attribute :cvv, String
  attribute :bill_name, String
  attribute :bill_address_1, String
  attribute :bill_address_2, String
  attribute :bill_city, String
  attribute :bill_state, String
  attribute :bill_zip_code, String
  attribute :bill_country, String
end
