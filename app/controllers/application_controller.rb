class ApplicationController < ActionController::Base
  before_action :set_navigation

  def set_navigation
    @navigation = [
      { title: 'Home', url: '/', icon: 'home' },
      { title: 'Game Zone', url: '/game-zone', icon: 'gamepad' },
      { title: 'Operations', url: '/operations', icon: 'folder-open' },
      { title: 'Clubs & Grounds', url: '/clubs-and-grounds', icon: 'building' }
    ]

    if current_user
      @actions = [
        { title: "Edit News", url: '/'},
        { title: "Edit Schedule", url: '/'},
        { title: "Edit Points Table", url: '/'},
        { title: "View Umpire Evaluations", url: '/'},
        { title: "View Match Reports", url: '/'},
        { title: "divider" },
        { title: "Confirm Game", url: '/'},
        { title: "Confirm Umpiring", url: '/'},
        { title: "Complete Match Report", url: '/'},
        { title: "Complete Umpire Evaluation", url: '/'},
        { title: "divider" },
        { title: "Logout", url: '/users/sign_out', icon: 'sign-out'}
      ]
    else
      @actions = [
        { title: 'Login', url: '/users/sign_in', icon: 'user'},
      ]
    end
  end

  def index
    @news = News.all
  end

  def clubs_grounds
  end

end
