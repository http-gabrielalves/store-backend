class Product < ApplicationRecord
    validates :name, presence: true
    validates :image, presence: true
    validates :description, presence: true
    validates :category, presence: true
    validates :unit, presence: true
    validates :stocked, presence: true
    validates :price, presence: true
    
    belongs_to :measurement_unit, optional: true
end

