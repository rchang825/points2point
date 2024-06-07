class CalculationsController < ApplicationController
  def index
    @loyalty_program = LoyaltyProgram.find_by_id(params['loyalty_program'])
    @goal = params['goal']
    @partnered_loyalty_programs = LoyaltyProgram.joins(:card_partnerships).distinct
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

  def optimize
    @loyalty_program = LoyaltyProgram.find_by_id(params['loyalty_program'])
    @goal = params['goal']
    @partnerships = @loyalty_program.card_partnerships.sort_by { |p| p.conversion_rate }
    @partnerships.reverse!
    @optimized_partnerships = optimize_points(@partnerships)

    puts "AFTER OPTIMIZATION"
    puts @optimized_partnerships
    puts "*******************"
  end

  private
  def optimize_points(partnerships)
    optimized = []
    points_needed = @goal.to_i
    partnerships.each do |partnership|
      puts partnership.card.name
      if points_needed == 0
          optimized.push([partnership, 0])
      elsif (points_needed - partnership.card.points * partnership.conversion_rate) >= 0
        points_needed = points_needed - partnership.card.points * partnership.conversion_rate
        optimized.push([partnership, partnership.card.points])
      else
        subpoints = points_needed / partnership.conversion_rate
        optimized.push([partnership, subpoints])
        points_needed = 0
      end
    end
    [optimized, points_needed]
  end
end
