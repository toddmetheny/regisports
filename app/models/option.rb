class Option < ActiveRecord::Base
  belongs_to :event
  has_many :reservations, dependent: :destroy
end
