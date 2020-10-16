class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :game

	rails_admin do
  	list do
  		sort_by :game_id
  		field :user do
  			pretty_value do
  				"#{value.try(:last_name)}, #{value.try(:first_name)}"
  			end
  		end
  		field :game do
  			pretty_value do
  				"#{value.try(:id)} - #{Game.find(value.try(:id)).get_home_acronym} vs #{Game.find(value.try(:id)).get_away_acronym}"
  			end
  		end
  		field :content
      field :created_at
      field :updated_at
  	end
  end
end
