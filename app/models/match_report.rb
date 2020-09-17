class MatchReport < ApplicationRecord
	belongs_to :user
	belongs_to :game

	def self.match_report_options
		[
      {
        title: 'Payment Before Leaving',
        name: 'match_report[payment]',
      },
      {
        title: '30-Yard Circle Marking',
        name: 'match_report[thirty_circle]',
      },
      {
        title: 'Boundary Markings',
        name: 'match_report[boundary]',
      },
      {
        title: 'Scorecard Usage',
        name: 'match_report[scorecard]',
      },
      {
        title: 'Adequate ice cold portable water/drinks',
        name: 'match_report[water]',
      },
      {
        title: 'Condition of pitch (carpet, edges, ends)',
        name: 'match_report[pitch]',
      },
      {
        title: 'Outfield/Infield Condition (grass height, litter)',
        name: 'match_report[condition]',
      },
      {
        title: 'Wide Line Marking',
        name: 'match_report[wide]',
      },
      {
        title: 'Player Behavior',
        name: 'match_report[behavior]',
      }
    ]
	end

	def get_game
  	return Game.find(self.game_id)
  end

  def user_id_enum
  	User.all.map{|u| ["#{u.last_name}, #{u.first_name}", u.id]}
  end

  def game_id_enum
  	Game.all.map{|g| ["#{g.get_home_acronym} vs #{g.get_home_acronym}", g.id]}
  end

  def get_current_user_club_acronym
    game = Game.find(self.game_id)
    umpire_club = Club.find(game.umpire_id)
    
    return umpire_club.acronym
  end
end
