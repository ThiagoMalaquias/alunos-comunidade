require 'test_helper'

class AlunosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aluno = alunos(:one)
  end

  test "should get index" do
    get alunos_url
    assert_response :success
  end

  test "should get new" do
    get new_aluno_url
    assert_response :success
  end

  test "should create aluno" do
    assert_difference('Aluno.count') do
      post alunos_url, params: { aluno: { aff: @aluno.aff, aff_name: @aluno.aff_name, callback_type: @aluno.callback_type, cms_marketplace: @aluno.cms_marketplace, cms_vendor: @aluno.cms_vendor, confirmation_purchase_date: @aluno.confirmation_purchase_date, currency: @aluno.currency, email: @aluno.email, first_name: @aluno.first_name, full_price: @aluno.full_price, hottok: @aluno.hottok, last_name: @aluno.last_name, name: @aluno.name, name_subscription_plan: @aluno.name_subscription_plan, original_offer_price: @aluno.original_offer_price, payment_engine: @aluno.payment_engine, payment_type: @aluno.payment_type, phone_checkout_local_code: @aluno.phone_checkout_local_code, phone_checkout_number: @aluno.phone_checkout_number, price: @aluno.price, prod: @aluno.prod, prod_name: @aluno.prod_name, producer_name: @aluno.producer_name, purchase_date: @aluno.purchase_date, status: @aluno.status, xcode: @aluno.xcode } }
    end

    assert_redirected_to aluno_url(Aluno.last)
  end

  test "should show aluno" do
    get aluno_url(@aluno)
    assert_response :success
  end

  test "should get edit" do
    get edit_aluno_url(@aluno)
    assert_response :success
  end

  test "should update aluno" do
    patch aluno_url(@aluno), params: { aluno: { aff: @aluno.aff, aff_name: @aluno.aff_name, callback_type: @aluno.callback_type, cms_marketplace: @aluno.cms_marketplace, cms_vendor: @aluno.cms_vendor, confirmation_purchase_date: @aluno.confirmation_purchase_date, currency: @aluno.currency, email: @aluno.email, first_name: @aluno.first_name, full_price: @aluno.full_price, hottok: @aluno.hottok, last_name: @aluno.last_name, name: @aluno.name, name_subscription_plan: @aluno.name_subscription_plan, original_offer_price: @aluno.original_offer_price, payment_engine: @aluno.payment_engine, payment_type: @aluno.payment_type, phone_checkout_local_code: @aluno.phone_checkout_local_code, phone_checkout_number: @aluno.phone_checkout_number, price: @aluno.price, prod: @aluno.prod, prod_name: @aluno.prod_name, producer_name: @aluno.producer_name, purchase_date: @aluno.purchase_date, status: @aluno.status, xcode: @aluno.xcode } }
    assert_redirected_to aluno_url(@aluno)
  end

  test "should destroy aluno" do
    assert_difference('Aluno.count', -1) do
      delete aluno_url(@aluno)
    end

    assert_redirected_to alunos_url
  end
end
