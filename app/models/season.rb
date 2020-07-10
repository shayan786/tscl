class Season < ApplicationRecord
	has_many :games
	has_many :points, class_name: 'Points'
end
