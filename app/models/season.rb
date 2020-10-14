class Season < ApplicationRecord
	has_many :games
	has_many :points, class_name: 'Points'

	def get_display_name
		"#{self.year}" + ' - ' + self.over_format + ' Over'
	end

	def display_season
		# "#{self.year}" + ' - ' + self.over_format + ' Over'
	end

	rails_admin do
		object_label_method :display_season
  end
end
