class Game < ApplicationRecord
	belongs_to :season
	has_many :comments
	has_many :umpire_evaluations
	has_one :match_report

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
		umpire = User.find(self.umpire_user_id)

		return "#{umpire.first_name} #{umpire.last_name}"
	end

	def get_umpire_level
		umpire = User.find(self.umpire_user_id)

		return umpire.umpire_level
	end

	def get_home_comment
		home = Club.find(self.home_id)
		home_comment = nil

		self.comments.each do |c|
			clubs = User.find(c.user_id).clubs
			if clubs.includes(id: self.home_id)
				home_comment = c
			end
		end	

		return home_comment
	end

	def get_away_comment
		away = Club.find(self.away_id)
		away_comment = nil

		self.comments.each do |c|
			clubs = User.find(c.user_id).clubs
			if clubs.includes(id: self.away_id)
				away_comment = c
			end
		end	

		return away_comment
	end

	def get_umpire_comment
		umpire = Club.find(self.away_id)
		umpire_comment = nil

		self.comments.each do |c|
			clubs = User.find(c.user_id).clubs
			if clubs.includes(id: self.umpire_id)
				umpire_comment = c
			end
		end	

		return umpire_comment
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

	def over_format_enum
		[['35 Over', 35], ['T20', 20]]
	end

	rails_admin do
  	list do
  		field :date
  		field :home_id
  		field :away_id
  		field :umpire_id
  		field :hc
  		field :ac
  		field :uc
  	end
  end
end
