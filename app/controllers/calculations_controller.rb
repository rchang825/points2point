class CalculationsController < ApplicationController
  def index
    @partnered_loyalty_programs = LoyaltyProgram.joins(:card_partnerships).distinct
    @loyalty_program = LoyaltyProgram.find_by_id(params['loyalty_program'])
    @goal = params['goal']
    puts "PARTNERSHIP POINTS: "
    submitted_points = params['partnerships']&.permit!&.to_h&.entries&.map{ |a,b| {partnership_id: a, points: b['points_used']} }
    puts submitted_points.inspect
  end
end
