class Photoshoot < ApplicationRecord
    belongs_to :portfolio
    has_many :images, dependent: :destroy
end
