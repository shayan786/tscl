class GameController < ActionController::Base
	before_action :authenticate, :set_navigation
  $current_over_format = Navigation.current_season[:over_format]

  def set_navigation
    @navigation = Navigation.items
    @actions = Navigation.actions(current_user)

    @news = News.last(3).reverse
    @upcoming_games = Season.find_by(year: Time.now.year, over_format: $current_over_format).games.where('date >= ?', DateTime.now).order('date ASC').limit(10)
    @points = Season.find_by(year: Time.now.year, over_format: $current_over_format).points.order('wins DESC, total_points DESC')
  end

	def view
    @game = Game.find(params[:id])
	end

	def confirm_game_list
		if !current_user.is_captain
			redirect_to '/'
		end
		
		@games = []

		current_user.clubs.each do |c|
			Season.find_by(year: Time.now.year, over_format: $current_over_format).games.where(home_id: c.id).each do |g|
				@games.push(g)
			end

			Season.find_by(year: Time.now.year, over_format: $current_over_format).games.where(away_id: c.id).each do |g|
				@games.push(g)
			end
		end
	end

	def confirm_captain
    @game = Game.find(params[:id])

		if !current_user.is_captain
      flash[:error] = "Unauthorized"
			redirect_to '/'
    elsif @game.hc && @game.ac
      flash[:error] = "Game has already been confirmed."
      redirect_to '/game/confirm/captain'
    end

	end

  def confirm_captain_new
    game = Game.find(comment_params[:game_id])
    home_club = Club.find(game.home_id)
    away_club = Club.find(game.away_id)

    comment = game.comments.build(comment_params)
    comment.user_id = current_user.id

    if (current_user.clubs.exists?(home_club.id))
      game.hc = true
      game.save
    elsif (current_user.clubs.exists?(away_club.id))
      game.ac = true
      game.save
    else
      flash[:error] = "Unable to find correct club."

      redirect_to '/game/confirm/captain'
    end

    if comment.save(validate: false)
      flash[:notice] = "Game is confirmed."
    else
      flash[:error] = "Something went wrong, game is not confirmed."
    end

    redirect_to '/game/confirm/captain'
  end

  def confirm_umpire_list
    if !current_user.is_captain
      redirect_to '/'
    end

    @games = []

    current_user.clubs.each do |c|
      Season.find_by(year: Time.now.year, over_format: $current_over_format).games.where(umpire_id: c.id).each do |g|
        @games.push(g)
      end
    end
  end

	def confirm_umpire
    @game = Game.find(params[:id])
    @umpires = User.where(umpire_level: ['0+', '1', '2']).order('last_name ASC')

    if !current_user.is_captain
      flash[:error] = "Unauthorized."
      redirect_to '/'
    elsif @game.uc
      flash[:error] = "Umpiring has already been confirmed."
      redirect_to '/game/confirm/umpire'
    end
	end

  def confirm_umpire_new
    game = Game.find(comment_params[:game_id])
    game.uc = true
    game.umpire_user_id = game_params[:umpire_user_id]
    game.save

    game.uc = true
    game.umpire_user_id = game_params[:umpire_user_id]
    game.save

    comment = game.comments.build(comment_params)
    comment.user_id = current_user.id

    if comment.save(validate: false)
      flash[:notice] = "Game umpire is confirmed."
    else
      flash[:error] = "Something went wrong, game is not confirmed."
    end
    
    redirect_to '/game/confirm/umpire'
  end

  def confirm_umpire_list
    if !current_user.is_captain
      redirect_to '/'
    end

    @games = []

    current_user.clubs.each do |c|
      Season.find_by(year: Time.now.year, over_format: $current_over_format).games.where(umpire_id: c.id).each do |g|
        @games.push(g)
      end
    end
  end

  def umpire_evaluations_list
    if !current_user
      redirect_to '/'
    end

    @evals = []

    if (params[:year] && params[:over_format])
      season = Season.find_by(year: params[:year], over_format: params[:over_format]) || nil

      if season
        season.games.each do |g|
          g.umpire_evaluations.each do |ue|
            @evals.push(ue)
          end
        end
      end
    else
      Season.find_by(year: Time.now.year, over_format: $current_over_format).games.order('date ASC').each do |g|
        g.umpire_evaluations.each do |ue|
          @evals.push(ue)
        end
      end
    end
  end

  def umpire_evaluations_captain_list
    if !current_user.is_captain
      redirect_to '/'
    end

    @fixtures = []

    current_user.clubs.each do |c|
      Season.find_by(year: Time.now.year, over_format: $current_over_format).games.where(home_id: c.id).each do |g|
        @fixtures.push(g)
      end

      Season.find_by(year: Time.now.year, over_format: $current_over_format).games.where(away_id: c.id).each do |g|
        @fixtures.push(g)
      end
    end
  end

  def umpire_evaluations_form
    if !current_user.is_captain
      redirect_to '/'
    end

    @game = Game.find(params[:id])
  end

  def umpire_evaluations_new
    game = Game.find(umpire_evaluation_params[:game_id])
    home_club = Club.find(game.home_id)
    away_club = Club.find(game.away_id)

    if (current_user.clubs.exists?(home_club.id))
      game.he = true
      game.save
    elsif (current_user.clubs.exists?(away_club.id))
      game.ae = true
      game.save
    else
      flash[:error] = "Unable to find correct club."
    end

    umpire_evaluation = game.umpire_evaluations.build(umpire_evaluation_params)
    umpire_evaluation.user_id = current_user.id 

    if umpire_evaluation.save(validate: false)
      flash[:notice] = "Umpire Evaluation has been completed."
    else
      flash[:error] = "Something went wrong, game is not confirmed."
    end
    
    redirect_to '/game/umpire-evaluations/captain'
  end

  def umpire_evaluation
    @ue = UmpireEvaluation.find(params[:id])
    @game = Game.find(@ue.game_id)
  end

  def match_reports_list
    if !current_user
      redirect_to '/'
    end

    @reports = []

    if (params[:year] && params[:over_format])
      season = Season.find_by(year: params[:year], over_format: params[:over_format]) || nil

      if season
        season.games.each do |g|
          if g.match_report
            @reports.push(g.match_report)
          end
        end
      end
    else
      Season.find_by(year: Time.now.year, over_format: $current_over_format).games.order('date ASC').each do |g|
        if g.match_report
          @reports.push(g.match_report)
        end
      end
    end
  end

  def match_reports_captain_list
    if !current_user.is_captain
      redirect_to '/'
    end

    @fixtures = []

    current_user.clubs.each do |c|
      Season.find_by(year: Time.now.year, over_format: $current_over_format).games.where(umpire_id: c.id).each do |g|
        @fixtures.push(g)
      end
    end
  end

  def match_reports_form
    @game = Game.find(params[:id])
  end

  def match_reports_new
    game = Game.find(match_report_params[:game_id])
    umpire_club = Club.find(game.umpire_id)

    game.mr = true
    game.save

    match_report = game.build_match_report(match_report_params)
    match_report.user_id = current_user.id

    if match_report.save(validate: false)
      flash[:notice] = "Match Report has been completed."
    else
      flash[:error] = "Something went wrong, game is not confirmed."
    end
    
    redirect_to '/game/match-reports/captain'
  end

  def match_report
    @mr = MatchReport.find(params[:id])
    @game = Game.find(@mr.game_id)
  end

  def moms
    @moms = []

    if (params[:year] && params[:over_format])
      season = Season.find_by(year: params[:year], over_format: params[:over_format]) || nil

      if season
        season.games.each do |g|
          if g.mom
            @moms.push(g.mom)
          end
        end
      end
    else
      Season.find_by(year: Time.now.year, over_format: $current_over_format).games.order('date ASC').each do |g|
        if g.mom
          @moms.push(g.mom)
        end
      end
    end
  end

  def winners
    @winners = Winner.all.order('created_at DESC')
  end

	def authenticate
		if !current_user
			redirect_to new_user_session_path
		end
	end

  def comment_params
    params.require(:comment).permit(:game_id, :content)
  end

  def game_params
    params.require(:game).permit(:umpire_user_id)
  end

  def umpire_evaluation_params
    params.require(:umpire_evaluation).permit(:start_time, :nu_match_result, :nu_lbw, :nu_caught, :nu_run_out, :nu_no_balls, :nu_consistency, :nu_laws, :nu_signal, :nu_pressure, :nu_overall, :nu_attire, :nu_comm_partner, :nu_comm_captain, :lu_stump, :lu_run_out, :lu_no_balls, :lu_no_balls, :lu_consistency, :lu_laws, :lu_signal, :lu_overall, :lu_comm_nu, :lu_fair, :comments, :game_id)
  end

  def match_report_params
    params.require(:match_report).permit(:start_time, :match_result, :payment, :thirty_circle, :boundary, :scorecard, :water, :pitch, :condition, :wide, :behavior, :comments, :game_id)
  end
end