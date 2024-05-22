class Card < ApplicationRecord
  has_many :card_partnerships
  has_many :loyalty_programs, through: :card_partnerships
  def value
    points * conversion_rate / 100
  end
end
