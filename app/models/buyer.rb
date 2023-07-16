class Buyer < ApplicationRecord
    belongs_to :farmer
    has_many :orders
    has_many :buyer_requests
end
