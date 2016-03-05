class Event < ActiveRecord::Base
	belongs_to :user
	has_many :reservations, through: :options
	has_many :orders, through: :reservations 
	has_many :options, dependent: :destroy
	has_attached_file :image, dependent: :destroy
	validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

    has_attached_file :imagebig, dependent: :destroy
	validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }


	                     
                
end

