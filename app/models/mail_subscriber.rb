class MailSubscriber < ActiveRecord::Base
	validates_uniqueness_of :email, :case_sensitive => false
end
