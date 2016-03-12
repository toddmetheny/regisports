class Order < ActiveRecord::Base
  belongs_to :order_status
  belongs_to :purchase
  has_many :reservations
  before_create :set_order_status
  before_create :create_unique_identifier
  before_save :total_for_no_price
  before_save :update_subtotal
  before_save :update_shipping
  before_save :update_tax
  before_save :update_total
  after_update :update_reservations

  def self.search(search)
    where("cast(id as text) LIKE ?", "%#{search}%")
    #where("cast(id as text) LIKE ? OR order_status_id LIKE ? ", "%#{search}%", "%#{search}%")

  end
  def self.search_by_status(search)
      where("cast(order_status_id as text) LIKE ? ", "%#{search}%").order("created_at desc")
  end  
  def to_param
     uuid
   end
# def order_status
#     self.order_status_id
# end
  # def update_reservations_status
  #   if self.order_status_id == 2
  #     reservations.update_status_completed
  #   end     
  # end
  def subtotal
    reservations.collect{ |r| r.price }.sum
  end

  def tax
    reservations.collect{ |r| r.tax }.sum
  end

  def shipping
    reservations.collect{ |r| r.shipping }.sum
  end 


  def total
    self[:total] = subtotal + tax + shipping
  end     

  def total_for_no_price
    if self.subtotal.nil?
      self[:subtotal] = 0.0
    end
  end
  def set_tax
    if self.tax.nil?
      self[:tax] = 0.0
    end
  end  

   def create_unique_identifier
     self.uuid = SecureRandom.uuid
   end
private
  def self.update_reservations
    if self.order_status_id == 2
      Reservation.update_status_completed
    end  
  end
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_shipping
    self[:shipping] = shipping
  end

  def update_tax
    self[:tax] = tax
  end

  def update_total
    self[:total] = total
  end

end
