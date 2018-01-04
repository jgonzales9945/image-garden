class AddAttachmentGImageToGardens < ActiveRecord::Migration
  def self.up
    change_table :gardens do |t|
      t.attachment :g_image
    end
  end

  def self.down
    remove_attachment :gardens, :g_image, :description
  end
end
