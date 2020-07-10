class Club < ApplicationRecord
	has_many :user_club_associations
  has_many :users, :through => :user_club_associations
  has_many :points, class_name: 'Points'

  def get_captains
  	if self.users && self.users.where(is_captain: true).count > 0
  		return self.users.where(is_captain: true).map{|u| (u.first_name + ' ' + u.last_name)}.join(",")
  	else
  		return '-'
  	end
  end
end
