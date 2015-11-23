class Event < ActiveRecord::Base
	has_many :options, dependent: :destroy
	has_attached_file :image, dependent: :destroy
	validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

    has_attached_file :imagebig, dependent: :destroy
	validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
                
end

