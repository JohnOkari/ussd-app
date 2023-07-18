class Farmer < ApplicationRecord
    has_many :buyers
    has_many :products
    has_many :farmer_responses
end
