class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_club_associations
  has_many :clubs, :through => :user_club_associations
  has_many :comments
  has_many :umpire_evaluations
  has_many :match_reports

  # attr_accessible :club_ids
  def club_ids=(ids)
    unless (ids = ids.map(&:to_i).select { |i| i>0 }) == (current_ids = user_club_associations.map(&:club_id))
      (current_ids - ids).each { |id| user_club_associations.select{|b|b.club_id == id}.first.mark_for_destruction }
      ids.each_with_index do |id, index|
        if current_ids.include? (id)
          user_club_associations.select { |b| b.club_id == id }.first.position = (index+1)
        else
          user_club_associations.build({:club_id => id, :position => (index+1)})
        end
      end
    end
  end

  rails_admin do
  	create do
  		field :last_name
  		field :first_name
  		field :email
  		field :umpire_level
  		field :is_active
  		field :is_ec
  		field :is_captain
      field :admin
      field :clubs
  	end

  	edit do
  		field :last_name
  		field :first_name
  		field :email
  		field :umpire_level
  		field :is_active
  		field :is_ec
  		field :is_captain
      field :admin
      field :clubs
  	end

  	list do
  		field :last_name
  		field :first_name
  		field :email
  		field :umpire_level
  		field :is_active
  		field :is_ec
  		field :is_captain
      field :clubs
  	end

    configure :user_club_associations do
      visible(false)
    end
  end

  def umpire_level_enum
  	[['0', '0'], ['0+', '0+'], ['1', '1'], ['2', '2']]
  end

  def get_full_name
    return "#{self.first_name} #{self.last_name}"
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
