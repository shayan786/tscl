class UmpireEvaluation < ApplicationRecord
	belongs_to :user, validate: false
	belongs_to :game

  def self.neutral_umpire_options
    [
      {
        title: 'LBW Decisions',
        name: 'umpire_evaluation[nu_lbw]',
      },
      {
        title: 'Caught Behind',
        name: 'umpire_evaluation[nu_caught]',
      },
      {
        title: 'Run-out Decisions',
        name: 'umpire_evaluation[nu_run_out]',
      },
      {
        title: 'No-Balls & Wides',
        name: 'umpire_evaluation[nu_no_balls]',
      },
      {
        title: 'Consistency in Decisions',
        name: 'umpire_evaluation[nu_consistency]',
      },
      {
        title: 'Application of Laws',
        name: 'umpire_evaluation[nu_laws]',
      },
      {
        title: 'Proper Signaling',
        name: 'umpire_evaluation[nu_signal]',
      },
      {
        title: 'Withstanding Pressure',
        name: 'umpire_evaluation[nu_pressure]',
      },
      {
        title: 'Overall Concentration',
        name: 'umpire_evaluation[nu_overall]',
      },
      {
        title: 'Attire',
        name: 'umpire_evaluation[nu_attire]',
      },
      {
        title: 'Communication with Partner',
        name: 'umpire_evaluation[nu_comm_partner]',
      },
      {
        title: 'Communication with Captains',
        name: 'umpire_evaluation[nu_comm_captain]',
      }
    ]
  end

  def self.leg_umpire_options
    [
      {
        title: 'Stumped-out Decisions',
        name: 'umpire_evaluation[lu_stump]',
      },
      {
        title: 'Run-out Decisions',
        name: 'umpire_evaluation[lu_run_out]',
      },
      {
        title: 'No-Balls',
        name: 'umpire_evaluation[lu_no_balls]',
      },
      {
        title: 'Consistency in Decisions',
        name: 'umpire_evaluation[lu_consistency]',
      },
      {
        title: 'Application of Laws',
        name: 'umpire_evaluation[lu_laws]',
      },
      {
        title: 'Proper Signaling',
        name: 'umpire_evaluation[lu_signal]',
      },
      {
        title: 'Overall Concentration',
        name: 'umpire_evaluation[lu_overall]',
      },
      {
        title: 'Communication with NU',
        name: 'umpire_evaluation[lu_comm_nu]',
      },
      {
        title: 'Fair Play',
        name: 'umpire_evaluation[lu_fair]',
      }
    ]
  end

	def user_id_enum
  	User.all.map{|u| ["#{u.last_name}, #{u.first_name}", u.id]}
  end

  def game_id_enum
  	Game.all.map{|g| ["#{g.get_home_acronym} vs #{g.get_home_acronym}", g.id]}
  end

  def get_game
  	return Game.find(self.game_id)
  end

  def get_current_user_club_acronym
    game = Game.find(self.game_id)
    home_club = Club.find(game.home_id)
    away_club = Club.find(game.away_id)
    user = User.find(self.user_id)

    if (user.clubs.exists?(home_club.id))
      return home_club.acronym
    else
      return away_club.acronym
    end
  end
end
