class Session < ActiveRecord::Base
	belongs_to :users
	validates_confirmation_of :password_digest
end
