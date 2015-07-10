class Cafe < ActiveRecord::Base

	validates :mimg, :limg, :desc, :feature, :price, :fprice, presence: true
end


