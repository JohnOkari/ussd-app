class Buyer < ApplicationRecord
    belongs_to :farmer
    has_many :orders
end
