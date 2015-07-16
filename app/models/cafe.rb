class Cafe < ActiveRecord::Base

	validates :mimg, :limg, :desc, :feature, :price, :fprice, presence: true

	searchkick word_middle: [:desc, :feature, :fprice]

	# self.per_page = 9
end


