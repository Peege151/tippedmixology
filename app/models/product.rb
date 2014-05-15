require 'file_size_validator'
class Product < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true

end
