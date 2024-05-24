class CalculationsController < ApplicationController
  def index
    @partnered_loyalty_programs = LoyaltyProgram.joins(:card_partnerships).distinct
    @loyalty_program = LoyaltyProgram.find_by_id(params['loyalty_program'])
    @goal = params['goal']
    puts "PARTNERSHIP POINTS: "
    submitted_points = params['partnerships']&.permit!&.to_h&.entries&.map{ |a,b| {card_partnership_id: a, points: b['points_used']} }
    puts submitted_points.inspect

    # total_points_used = 0
    # for each card
    # find card_partnership with id
    # total_points_used += points_used * card_partnership.conversion_rate
    #
    # points_needed = @goal - total_points_used
    if submitted_points
      @total_points_used = 0
      submitted_points.each do |card_partnership|
        partnership = CardPartnership.find_by_id(card_partnership[:card_partnership_id])
        @total_points_used += card_partnership[:points].to_i * partnership.conversion_rate
      end
      @points_needed = @goal.to_i - @total_points_used
      puts "points needed: "
      puts @points_needed
    end
  end
end
