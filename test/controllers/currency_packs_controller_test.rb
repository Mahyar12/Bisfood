require 'test_helper'

class CurrencyPacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency_pack = currency_packs(:one)
  end

  test "should get index" do
    get currency_packs_url
    assert_response :success
  end

  test "should get new" do
    get new_currency_pack_url
    assert_response :success
  end

  test "should create currency_pack" do
    assert_difference('CurrencyPack.count') do
      post currency_packs_url, params: { currency_pack: { amount: @currency_pack.amount, discount: @currency_pack.discount, name: @currency_pack.name, price: @currency_pack.price } }
    end

    assert_redirected_to currency_pack_url(CurrencyPack.last)
  end

  test "should show currency_pack" do
    get currency_pack_url(@currency_pack)
    assert_response :success
  end

  test "should get edit" do
    get edit_currency_pack_url(@currency_pack)
    assert_response :success
  end

  test "should update currency_pack" do
    patch currency_pack_url(@currency_pack), params: { currency_pack: { amount: @currency_pack.amount, discount: @currency_pack.discount, name: @currency_pack.name, price: @currency_pack.price } }
    assert_redirected_to currency_pack_url(@currency_pack)
  end

  test "should destroy currency_pack" do
    assert_difference('CurrencyPack.count', -1) do
      delete currency_pack_url(@currency_pack)
    end

    assert_redirected_to currency_packs_url
  end
end
