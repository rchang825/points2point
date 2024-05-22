require "application_system_test_case"

class CardPartnershipsTest < ApplicationSystemTestCase
  setup do
    @card_partnership = card_partnerships(:one)
  end

  test "visiting the index" do
    visit card_partnerships_url
    assert_selector "h1", text: "Card partnerships"
  end

  test "should create card partnership" do
    visit card_partnerships_url
    click_on "New card partnership"

    fill_in "Card", with: @card_partnership.card_id
    fill_in "Conversion rate", with: @card_partnership.conversion_rate
    fill_in "Loyalty program", with: @card_partnership.loyalty_program_id
    fill_in "Notes", with: @card_partnership.notes
    click_on "Create Card partnership"

    assert_text "Card partnership was successfully created"
    click_on "Back"
  end

  test "should update Card partnership" do
    visit card_partnership_url(@card_partnership)
    click_on "Edit this card partnership", match: :first

    fill_in "Card", with: @card_partnership.card_id
    fill_in "Conversion rate", with: @card_partnership.conversion_rate
    fill_in "Loyalty program", with: @card_partnership.loyalty_program_id
    fill_in "Notes", with: @card_partnership.notes
    click_on "Update Card partnership"

    assert_text "Card partnership was successfully updated"
    click_on "Back"
  end

  test "should destroy Card partnership" do
    visit card_partnership_url(@card_partnership)
    click_on "Destroy this card partnership", match: :first

    assert_text "Card partnership was successfully destroyed"
  end
end
