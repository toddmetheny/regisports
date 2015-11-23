class AddAttachmentImagebigToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :imagebig
    end
  end

  def self.down
    remove_attachment :events, :imagebig
  end
end
