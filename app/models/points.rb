class Points < ApplicationRecord
	belongs_to :season
	belongs_to :club

	rails_admin do
  	list do
  		field :club
  		field :season
  		field :wins
  		field :loses
  		field :tied
  		field :bbowl
  		field :bbat
  		field :ue
      field :nur
      field :ss
      field :lzero
      field :jc
      field :nu
      field :gc
      field :palm
  	end

    configure :user_club_associations do
      visible(false)
    end
  end

	def club_id_enum
		Club.all.map{|c| [c.acronym, c.id]}
	end
end
