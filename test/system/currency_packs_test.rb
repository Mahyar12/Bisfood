require "application_system_test_case"

class CurrencyPacksTest < ApplicationSystemTestCase
  setup do
    @currency_pack = currency_packs(:one)
  end

  test "visiting the index" do
    visit currency_packs_url
    assert_selector "h1", text: "Currency Packs"
  end

  test "creating a Currency pack" do
    visit currency_packs_url
    click_on "New Currency Pack"

    fill_in "Amount", with: @currency_pack.amount
    fill_in "Discount", with: @currency_pack.discount
    fill_in "Name", with: @currency_pack.name
    fill_in "Price", with: @currency_pack.price
    click_on "Create Currency pack"

    assert_text "Currency pack was successfully created"
    click_on "Back"
  end

  test "updating a Currency pack" do
    visit currency_packs_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @currency_pack.amount
    fill_in "Discount", with: @currency_pack.discount
    fill_in "Name", with: @currency_pack.name
    fill_in "Price", with: @currency_pack.price
    click_on "Update Currency pack"

    assert_text "Currency pack was successfully updated"
    click_on "Back"
  end

  test "destroying a Currency pack" do
    visit currency_packs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Currency pack was successfully destroyed"
  end
end
