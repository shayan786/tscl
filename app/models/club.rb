class Club < ApplicationRecord
	has_many :user_club_associations
  has_many :users, :through => :user_club_associations
  has_many :points, class_name: 'Points'

  def get_captains
  	if self.users && self.users.where(is_captain: true).count > 0
  		return self.users.where(is_captain: true).map{|u| (u.first_name + ' ' + u.last_name)}
  	else
  		return ['-']
  	end
  end

  rails_admin do
    list do
      field :id
      field :name
      field :acronym
      field :address
      field :ground
      field :map
      field :users
    end
  end
end
