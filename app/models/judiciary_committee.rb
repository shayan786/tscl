class JudiciaryCommittee < ApplicationRecord
	def user_id_enum
		User.all.order('last_name ASC').map{|u| ["#{u.last_name}, #{u.first_name}", u.id]}
	end

  def year_enum
    [['2020', '2020'],['2021', '2021'],['2022', '2022'],['2023', '2023']]
  end

	rails_admin do
  	create do
  		field :user_id
      field :year
  	end

  	edit do
  		field :user_id
      field :year
  	end

  	list do
      field :user_id
      field :year
  	end
  end
end
