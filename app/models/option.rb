class Option < ActiveRecord::Base
  belongs_to :event
  has_many :reservations, dependent: :destroy

  before_save :set_tax
  before_save :set_shipping

  def set_tax
  	if self.tax.nil?
  		self[:tax] = 0
  	end  	
  end

  def set_shipping
  	if self.shipping.nil?
  		self[:shipping] = 0
  	end  	
  end

end
