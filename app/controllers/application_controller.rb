class ApplicationController < ActionController::Base
  before_action :set_navigation
  $news = []
  # News.last(3).reverse
  $upcoming_games = []
  # Season.find_by(year: Time.now.year).games.where('date >= ?', DateTime.now).order('date ASC')
  $clubs = Club.all
  $points = []
  #Season.find_by(year: Time.now.year).points.order('wins DESC')

  def set_navigation
    @navigation = Navigation.items
    @actions = Navigation.actions(current_user)
  end

  def index
  end

  def clubs_grounds
  end

  def constitution
    @doc = Document.find_by(title: 'Constitution')
  end

  def by_laws
    @doc = Document.find_by(title: 'By Laws')
  end

  def playing_conditions
    @doc = Document.find_by(title: 'Playig Conditions')
  end

  def laws_of_cricket
    @doc = Document.find_by(title: 'Laws of Cricket')
  end

  def fixtures
    if (params[:year] && params[:over_format])
      season = Season.find_by(year: params[:year], over_format: params[:over_format]) || nil

      @fixtures = season ? Season.find_by(year: params[:year], over_format: params[:over_format]).games.order('date ASC') : nil;
    else
      @fixtures = Season.find_by(year: Time.now.year, over_format: '35').games.order('date ASC') || nil
    end
  end

  def points_table
    if (params[:year] && params[:over_format])
      season = Season.find_by(year: params[:year], over_format: params[:over_format]) || nil

      @points = season ? Season.find_by(year: params[:year], over_format: params[:over_format]).points.order('Team ASC') : nil;
    else
      @points = Season.find_by(year: Time.now.year, over_format: '35').points.order('points ASC') || nil
    end
  end

  def approved_umpires
    @umpires = User.where(umpire_level: '0+').or(User.where(umpire_level: '1')).or(User.where(umpire_level: '2')).order('umpire_level DESC')
  end
end
