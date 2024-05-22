require "test_helper"

class CardPartnershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_partnership = card_partnerships(:one)
  end

  test "should get index" do
    get card_partnerships_url
    assert_response :success
  end

  test "should get new" do
    get new_card_partnership_url
    assert_response :success
  end

  test "should create card_partnership" do
    assert_difference("CardPartnership.count") do
      post card_partnerships_url, params: { card_partnership: { card_id: @card_partnership.card_id, conversion_rate: @card_partnership.conversion_rate, loyalty_program_id: @card_partnership.loyalty_program_id, notes: @card_partnership.notes } }
    end

    assert_redirected_to card_partnership_url(CardPartnership.last)
  end

  test "should show card_partnership" do
    get card_partnership_url(@card_partnership)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_partnership_url(@card_partnership)
    assert_response :success
  end

  test "should update card_partnership" do
    patch card_partnership_url(@card_partnership), params: { card_partnership: { card_id: @card_partnership.card_id, conversion_rate: @card_partnership.conversion_rate, loyalty_program_id: @card_partnership.loyalty_program_id, notes: @card_partnership.notes } }
    assert_redirected_to card_partnership_url(@card_partnership)
  end

  test "should destroy card_partnership" do
    assert_difference("CardPartnership.count", -1) do
      delete card_partnership_url(@card_partnership)
    end

    assert_redirected_to card_partnerships_url
  end
end
