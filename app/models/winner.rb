class Winner < ApplicationRecord
	belongs_to :season, validate: false

	def club_id_enum
		Club.all.map{|c| [c.acronym, c.id]}
	end

	def get_club_acroynm
		Club.find(self.club_id).acronym
	end

	rails_admin do
  	list do
  		field :season do
  			pretty_value do
  				"#{value.try(:year)} - #{value.try(:over_format)} Over"
  			end
  		end
  		field :club_id
  	end

  	create do
  		field :season_id, :enum do
  			enum do
  				Season.all.map{|s| ["#{s.year} - #{s.over_format} Over", s.id]}
  			end
  		end
  		field :club_id
  	end

  	edit do
  		field :season_id, :enum do
  			enum do
  				Season.all.map{|s| ["#{s.year} - #{s.over_format} Over", s.id]}
  			end
  		end
  		field :club_id
  	end
  end
end
