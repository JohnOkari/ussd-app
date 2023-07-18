class BuyerRequest < ApplicationRecord
  belongs_to :buyer
  has_many :farmer_responses
end
