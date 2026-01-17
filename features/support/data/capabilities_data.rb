# Capabilities data sourcing object
class CapabilitiesData < TestCentricity::DataSource
  # read data from Capabilities section of Environment data and populate the Capabilities data presenter object
  def find_capabilities(node_name)
    Capabilities.current = Capabilities.new(environs.read('Capabilities', node_name.to_s))
  end
end


# Capabilities data presenter object
class Capabilities < TestCentricity::DataPresenter
  attribute :caps

  def initialize(data)
    # must call super to initialize DataPresenter class
    super
    @caps = data
  end
end
