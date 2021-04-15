class Game < ApplicationRecord
	belongs_to :season, validate: false
	has_many :comments, validate: false
	has_many :umpire_evaluations, validate: false
	has_one :match_report, validate: false
	has_one :mom, validate: false

	def get_away_acronym
		return Club.find_by(id: self.away_id).acronym
	end

	def get_home_acronym
		return Club.find_by(id: self.home_id).acronym
	end

	def get_umpire_acronym
		return Club.find_by(id: self.umpire_id).acronym
	end

	def get_ground
		return Club.find_by(id: self.home_id).ground
	end

	def get_umpire_name
		if self.umpire_user_id && User.exists?(self.umpire_user_id)
			umpire = User.find(self.umpire_user_id)
			return "#{umpire.first_name} #{umpire.last_name}"
		else
			return "No umpire user assigned"
		end
	end

	def get_umpire_level
		if self.umpire_user_id
			umpire = User.find(self.umpire_user_id)
			return umpire.umpire_level
		else
			return "No umpire user assigned"
		end
	end

	def get_home_comment
		home_comment = nil

		self.comments.each do |c|
			c.user.clubs.each do |club|
				if club.id == self.home_id
					home_comment = c
				end
			end
		end

		return home_comment
	end

	def get_away_comment
		away_comment = nil

		self.comments.each do |c|
			c.user.clubs.each do |club|
				if club.id == self.away_id
					away_comment = c
				end
			end
		end

		return away_comment
	end

	def get_umpire_comment
		umpire_comment = nil

		self.comments.each do |c|
			c.user.clubs.each do |club|
				if club.id == self.umpire_id
					umpire_comment = c
				end
			end
		end

		return umpire_comment
	end

	def is_confirmed(current_user)
		if (current_user.clubs.exists?(self.home_id) && self.hc)
			return true
		elsif (current_user.clubs.exists?(self.away_id) && self.ac)
			return true
		else
			return false
		end
	end

	def is_ue_completed
		ues = self.umpire_evaluations

		# if !ues
		# 	return false,
		# elsif 
			
		# else
		# 	return true
		# end	
	end
	
	def home_id_enum
		Club.all.map{|c| [c.acronym, c.id]}
	end

	def away_id_enum
		Club.all.map{|c| [c.acronym, c.id]}
	end

	def umpire_id_enum
		Club.all.map{|c| [c.acronym, c.id]}
	end

	def ground_enum
		Club.all.map{|c| [c.ground, c.ground]}
	end

	def display_game
		self.date.strftime("%-m/%-d/%y") + ' - ' + self.get_home_acronym + ' vs ' + self.get_away_acronym
	end

	rails_admin do
		# object_label_method :display_game

  	list do
  		sort_by :date
  		field :date
  		field :season do
  			pretty_value do
  				"#{value.try(:year)} - #{value.try(:over_format)} Over"
  			end
  		end
  		field :home_id
  		field :away_id
  		field :umpire_id
  		field :ground
  	end

  	create do
  		field :date
  		field :season_id, :enum do
  			enum do
  				Season.all.map{|s| ["#{s.year} - #{s.over_format} Over", s.id]}
  			end
  		end
  		field :home_id
  		field :away_id
  		field :umpire_id
  		field :ground
  	end

  	edit do
  		field :date
  		field :home_id
  		field :away_id
  		field :umpire_id
  		field :ground
  		field :season_id, :enum do
  			enum do
  				Season.all.map{|s| ["#{s.year} - #{s.over_format} Over", s.id]}
  			end
  		end
  		field :hc
  		field :ac
  		field :uc
  	end
  end
end
