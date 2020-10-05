class Points < ApplicationRecord
	belongs_to :season
	belongs_to :club

	rails_admin do
  	list do
  		field :club
  		field :season do
        pretty_value do
          "#{value.try(:year)} - #{value.try(:over_format)} Over"
        end
      end
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

    create do
      field :club
      field :season, :enum do
        enum do
          Season.all.map{|s| ["#{s.year} - #{s.over_format} Over", s.id]}
        end
      end
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
