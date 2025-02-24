class ExecutiveCommittee < ApplicationRecord
	def role_enum
		[	['President', 'president'],
			['Vice-President', 'vice_president'],
			['Secretary', 'secretary'],
			['Treasurer', 'treasurer'],
			['Fifth Member', 'fifth_member']
		]
	end

	def user_id_enum
		User.all.order('last_name ASC').map{|u| ["#{u.last_name}, #{u.first_name}", u.id]}
	end

  def year_enum
    [['2020', '2020'],['2021', '2021'],['2022', '2022'],['2023', '2023'],['2024', '2024'],['2025', '2025']]
  end

	rails_admin do
  	create do
  		field :user_id
  		field :role
      field :year
  	end

  	edit do
  		field :user_id
  		field :role
      field :year
  	end

  	list do
      field :user_id
  		field :role
      field :year
  	end
  end
end
