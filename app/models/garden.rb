class Garden < ActiveRecord::Base
	has_attached_file :g_image, :styles => { :small => "150x150", :medium => "450x450"}
	has_many :comments
	
	validates_attachment_presence :g_image
	validates_attachment_size :g_image, :less_than => 1.megabytes
	validates_attachment_content_type :g_image, :content_type => ['image/gif', 'image/jpeg', 'image/png']
end
