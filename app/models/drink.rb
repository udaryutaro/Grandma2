class Drink < ApplicationRecord
	belongs_to :genre
	attachment :image
end
