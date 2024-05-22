class CardPartnershipsController < ApplicationController
  before_action :set_card_partnership, only: %i[ show edit update destroy ]

  # GET /card_partnerships or /card_partnerships.json
  def index
    @card_partnerships = CardPartnership.all
  end

  # GET /card_partnerships/1 or /card_partnerships/1.json
  def show
  end

  # GET /card_partnerships/new
  def new
    @card_partnership = CardPartnership.new
  end

  # GET /card_partnerships/1/edit
  def edit
  end

  # POST /card_partnerships or /card_partnerships.json
  def create
    @card_partnership = CardPartnership.new(card_partnership_params)

    respond_to do |format|
      if @card_partnership.save
        format.html { redirect_to card_partnership_url(@card_partnership), notice: "Card partnership was successfully created." }
        format.json { render :show, status: :created, location: @card_partnership }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card_partnership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_partnerships/1 or /card_partnerships/1.json
  def update
    respond_to do |format|
      if @card_partnership.update(card_partnership_params)
        format.html { redirect_to card_partnership_url(@card_partnership), notice: "Card partnership was successfully updated." }
        format.json { render :show, status: :ok, location: @card_partnership }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card_partnership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_partnerships/1 or /card_partnerships/1.json
  def destroy
    @card_partnership.destroy!

    respond_to do |format|
      format.html { redirect_to card_partnerships_url, notice: "Card partnership was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_partnership
      @card_partnership = CardPartnership.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_partnership_params
      params.require(:card_partnership).permit(:card_id, :loyalty_program_id, :conversion_rate, :notes)
    end
end
