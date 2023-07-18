class FarmerResponse < ApplicationRecord
  belongs_to :farmer
  belongs_to :buyer_request
end
