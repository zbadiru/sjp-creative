class Portfolio < ApplicationRecord
    belongs_to :user
    has_many :photoshoots  
    has_many :images, through: :photoshoots
end
