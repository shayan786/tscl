class News < ApplicationRecord
  has_one_attached :image

  rails_admin do
		create do
      field :title do 
        required true
      end
      field :image do
        required true
      end
  	end
  end
end
