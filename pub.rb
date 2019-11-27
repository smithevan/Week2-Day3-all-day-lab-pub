class Pub

attr_reader :name, :till 

  def initialize(name, till)
    @name = name
    @till = till
    @drinks = []
  end

end
