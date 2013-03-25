class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents, :price_in_dollars

  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true, :greater_than => 0}
  validates :price_in_dollars, :numericality => true
  
  def price_in_dollars
    if self.price_in_cents?
      self.price_in_cents.to_f / 100 # integer => 2 decimal float
    end
  end

	# setter method
  def price_in_dollars=(amount)
    if amount.present?
    	self.price_in_cents = (amount.to_f * 100).to_i
    end
  end

end