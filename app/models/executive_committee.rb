class ExecutiveCommittee < ApplicationRecord
	belongs_to :season

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

	rails_admin do
  	create do
  		field :user_id
  		field :role
      field :season
  	end

  	edit do
  		field :user_id
  		field :role
      field :season
  	end

  	list do
      field :user_id
  		field :role
      field :season
  	end
  end
end
