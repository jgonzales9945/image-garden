class User < ActiveRecord::Base
	
  validates_confirmation_of :password_digest
  #validates_presence_of :password_digest, :on => :create
  #has_secure_password
  validates_presence_of :name
  validates_uniqueness_of :name
end
