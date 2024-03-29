# User data sourcing object
class UserDataSource < TestCentricity::DataSource
  def find_user(node_name)
    UserData.current = UserData.new(environs.read('User_creds', node_name))
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

  def initialize(data)
    @username = data[:username]
    @password = data[:password]
    @full_name = data[:full_name]
    @ship_address_1 = data[:ship_address_1]
    @ship_address_2 = data[:ship_address_2]
    @ship_city = data[:ship_city]
    @ship_state = data[:ship_state]
    @ship_zip_code = data[:ship_zip_code]
    @ship_country = data[:ship_country]
    @cardholder_name = data[:cardholder_name]
    @card_num = data[:card_num]
    @expiry = data[:expiry]
    @cvv = data[:cvv]
    @bill_name = data[:bill_name]
    @bill_address_1 = data[:bill_address_1]
    @bill_address_2 = data[:bill_address_2]
    @bill_city = data[:bill_city]
    @bill_state = data[:bill_state]
    @bill_zip_code = data[:bill_zip_code]
    @bill_country = data[:bill_country]
    super
  end
end
