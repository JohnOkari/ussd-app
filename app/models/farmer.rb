class Farmer < ApplicationRecord
    has_many :buyers
    has_many :products
end
