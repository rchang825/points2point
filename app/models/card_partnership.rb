class CardPartnership < ApplicationRecord
  belongs_to :card
  belongs_to :loyalty_program
end
