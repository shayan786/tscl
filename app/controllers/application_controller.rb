class ApplicationController < ActionController::Base  
  before_action :set_navigation
  $current_over_format = Navigation.current_season[:over_format]

  def set_navigation
    @navigation = Navigation.items
    @actions = Navigation.actions(current_user)

    @news = News.last(3).reverse
    @upcoming_games = Season.find_by(year: Time.now.year, over_format: $current_over_format) == nil ? [] : Season.find_by(year: Time.now.year, over_format: $current_over_format).games.where('date >= ?', DateTime.now).order('date ASC').limit(10)
    @points = Season.find_by(year: Time.now.year, over_format: $current_over_format) == nil ? [] : Season.find_by(year: Time.now.year, over_format: $current_over_format).points.order('total_points DESC')
    @moms = Mom.order('created_at DESC').limit(5)
  end

  def index
  end

  def clubs_grounds
    @clubs = Club.where(is_active: true).order('name ASC')
  end

  def constitution
    @docs = Document.where(doc_type: 'constitution').order('updated_at DESC')
  end

  def constitution_view
    @pc = Document.find(params[:id])
  end

  def by_laws
    @docs = Document.where(doc_type: 'by_laws').order('updated_at DESC')
  end

  def by_laws_view
    @pc = Document.find(params[:id])
  end

  def playing_conditions
    @docs = Document.where(doc_type: '20_playing_conditions').or(Document.where(doc_type: '35_playing_conditions')).order('updated_at DESC')
  end

  def playing_conditions_view
    @pc = Document.find(params[:id])
  end

  def laws_of_cricket
    @doc = Document.find_by(doc_type: 'laws_of_cricket')
  end

  def meeting_minutes
    @mms = Document.where(doc_type: 'meeting_minute').order('updated_at DESC')
  end

  def meeting_minutes_view
    @mm = Document.find(params[:id])
  end

  def ec
    if (params[:year])
      @ec = ExecutiveCommittee.where(year: params[:year]) || nil
    else
      @ec = ExecutiveCommittee.where(year: Time.now.year) || nil
    end
  end

  def jc
    if (params[:year])
      @jc = JudiciaryCommittee.where(year: params[:year]) || nil
    else
      @jc = JudiciaryCommittee.where(year: Time.now.year) || nil
    end
  end

  def resources
    @resources = Document.where(doc_type: 'resource').order('updated_at DESC')
  end

  def resources_view
    @resource = Document.find(params[:id])
  end

  def coc_violations
    if !current_user
      redirect_to root
    end

    @cocs = Document.where(doc_type: 'coc_violation').order('updated_at DESC')
  end

  def coc_violations_view
    if !current_user
      redirect_to root
    end

    @cc = Document.find(params[:id])
  end

  def fixtures
    if (params[:year] && params[:over_format])
      season = Season.find_by(year: params[:year], over_format: params[:over_format]) || nil

      @fixtures = season ? Season.find_by(year: params[:year], over_format: params[:over_format]).games.order('date ASC') : nil;
    else
      @fixtures = Season.find_by(year: Time.now.year, over_format: $current_over_format) == nil ? nil : Season.find_by(year: Time.now.year, over_format: $current_over_format).games.order('date ASC')
    end
  end

  def points_table
    if (params[:year] && params[:over_format])
      season = Season.find_by(year: params[:year], over_format: params[:over_format]) || nil

      @points = season ? Season.find_by(year: params[:year], over_format: params[:over_format]).points.order('total_points DESC') : nil;
    else
      @points = Season.find_by(year: Time.now.year, over_format: $current_over_format).points.order('total_points DESC') || nil
    end
  end

  def approved_umpires
    @umpires = User.where(umpire_level: '0+').or(User.where(umpire_level: '1')).or(User.where(umpire_level: '2')).order('umpire_level DESC')
  end

  def players
    @players = User.all.order('last_name ASC')
  end
end
