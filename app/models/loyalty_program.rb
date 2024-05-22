class LoyaltyProgram < ApplicationRecord
  has_many :card_partnerships
  has_many :cards, through: :card_partnerships
end
