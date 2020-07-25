class Mom < ApplicationRecord
	has_one_attached :image
	belongs_to :user
	belongs_to :game

	rails_admin do
		create do
      field :game do 
        associated_collection_cache_all false
        associated_collection_scope do
          game = bindings[:object]
          Proc.new { |scope|
            scope = scope.order('date ASC')
          }
        end
      end
      field :user
      field :image
  	end

  	list do
      field :game
      field :user
      field :image
  	end
  end
end
