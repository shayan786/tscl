class Navigation < ApplicationRecord
	def self.items
		[
      { title: 'Home', url: '/', icon: 'home' },
      { title: 'Game Zone', url: '#', icon: 'gamepad', children: [
        { title: 'Fixtures', url: '/game-zone/fixtures' },
        { title: 'Points Table', url: '/game-zone/points-table' }, 
        { title: 'Approved Umpires', url: '/game-zone/approved-umpires' },
        { title: 'Players', url: '/game-zone/players' },
        { title: 'Man of the Match', url: '/game-zone/moms' }
        ] },
      { title: 'Operations', url: '#', icon: 'folder-open', children: [
        { title: 'Constitution', url: '/operations/constitution' },
        { title: 'By Laws', url: '/operations/by-laws' },
        { title: 'Playing Conditions', url: '/operations/playing-conditions' },
        { title: 'Laws of Cricket', url: '/operations/laws-of-cricket' },
        { title: 'Executive Committee', url: '/operations/ec' },
        { title: 'Judiciary Committee', url: '/operations/jc' },
        { title: 'Meeting Minutes', url: '/operations/meeting-minutes' }
        ] },
      { title: 'Clubs & Grounds', url: '/clubs-and-grounds', icon: 'building' }
    ]
	end

	def self.actions(current_user)
		if current_user && current_user.is_ec
      [
        { title: "Edit News", url: '/admin/news'},
        { title: "Edit Schedule", url: '/admin/game'},
        { title: "Edit Points Table", url: '/admin/points'},
        { title: "View Umpire Evaluations", url: '/game/umpire-evaluations'},
        { title: "View Match Reports", url: '/game/match-reports'},
        { title: "Select MOMs", url: '/admin/mom'},
        { title: "divider" },
        { title: "Confirm Game", url: '/game/confirm/captain'},
        { title: "Confirm Umpiring", url: '/game/confirm/umpire'},
        { title: "Complete Match Report", url: '/game/match-reports/captain'},
        { title: "Complete Umpire Evaluation", url: '/game/umpire-evaluations/captain'},
        { title: "divider" },
        { title: "COC Violations", url: '/coc-violations'},
        { title: "divider" },
        { title: "Logout", url: '/users/sign_out', icon: 'sign-out'}
      ]
    elsif current_user && current_user.is_captain
      [
        { title: "Confirm Game", url: '/game/confirm/captain'},
        { title: "Confirm Umpiring", url: '/game/confirm/umpire'},
        { title: "Complete Match Report", url: '/game/match-reports/captain'},
        { title: "Complete Umpire Evaluation", url: '/game/umpire-evaluations/captain'},
        { title: "divider" },
        { title: "COC Violations", url: '/coc-violations'},
        { title: "divider" },
        { title: "Logout", url: '/users/sign_out', icon: 'sign-out'}
      ]
    elsif current_user
      [
        { title: "COC Violations", url: '/coc-violations'},
        { title: "divider" },
        { title: "Logout", url: '/users/sign_out', icon: 'sign-out'}
      ]
    else
      [
        { title: 'Login', url: '/users/sign_in', icon: 'user'},
      ]
    end
	end
end
