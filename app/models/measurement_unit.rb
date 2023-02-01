class MeasurementUnit < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :abbreviation, presence: true, uniqueness: true
    has_many :products
end
