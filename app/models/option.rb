class Option < ActiveRecord::Base
  belongs_to :event
  has_many :registrations, dependent: :destroy
end
