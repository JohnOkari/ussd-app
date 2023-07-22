class Order < ApplicationRecord
    belongs_to :buyer
    belongs_to :Product
    has_one :delivery
    has_one :payment
end
