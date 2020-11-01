require "application_system_test_case"

class AlunosTest < ApplicationSystemTestCase
  setup do
    @aluno = alunos(:one)
  end

  test "visiting the index" do
    visit alunos_url
    assert_selector "h1", text: "Alunos"
  end

  test "creating a Aluno" do
    visit alunos_url
    click_on "New Aluno"

    fill_in "Aff", with: @aluno.aff
    fill_in "Aff name", with: @aluno.aff_name
    fill_in "Callback type", with: @aluno.callback_type
    fill_in "Cms marketplace", with: @aluno.cms_marketplace
    fill_in "Cms vendor", with: @aluno.cms_vendor
    fill_in "Confirmation purchase date", with: @aluno.confirmation_purchase_date
    fill_in "Currency", with: @aluno.currency
    fill_in "Email", with: @aluno.email
    fill_in "First name", with: @aluno.first_name
    fill_in "Full price", with: @aluno.full_price
    fill_in "Hottok", with: @aluno.hottok
    fill_in "Last name", with: @aluno.last_name
    fill_in "Name", with: @aluno.name
    fill_in "Name subscription plan", with: @aluno.name_subscription_plan
    fill_in "Original offer price", with: @aluno.original_offer_price
    fill_in "Payment type", with: @aluno.payment_type
    fill_in "Phone checkout local code", with: @aluno.phone_checkout_local_code
    fill_in "Phone checkout number", with: @aluno.phone_checkout_number
    fill_in "Price", with: @aluno.price
    fill_in "Prod", with: @aluno.prod
    fill_in "Prod name", with: @aluno.prod_name
    fill_in "Producer name", with: @aluno.producer_name
    fill_in "Purchase date", with: @aluno.purchase_date
    fill_in "Status", with: @aluno.status
    fill_in "Xcode", with: @aluno.xcode
    click_on "Create Aluno"

    assert_text "Aluno was successfully created"
    click_on "Back"
  end

  test "updating a Aluno" do
    visit alunos_url
    click_on "Edit", match: :first

    fill_in "Aff", with: @aluno.aff
    fill_in "Aff name", with: @aluno.aff_name
    fill_in "Callback type", with: @aluno.callback_type
    fill_in "Cms marketplace", with: @aluno.cms_marketplace
    fill_in "Cms vendor", with: @aluno.cms_vendor
    fill_in "Confirmation purchase date", with: @aluno.confirmation_purchase_date
    fill_in "Currency", with: @aluno.currency
    fill_in "Email", with: @aluno.email
    fill_in "First name", with: @aluno.first_name
    fill_in "Full price", with: @aluno.full_price
    fill_in "Hottok", with: @aluno.hottok
    fill_in "Last name", with: @aluno.last_name
    fill_in "Name", with: @aluno.name
    fill_in "Name subscription plan", with: @aluno.name_subscription_plan
    fill_in "Original offer price", with: @aluno.original_offer_price
    fill_in "Payment type", with: @aluno.payment_type
    fill_in "Phone checkout local code", with: @aluno.phone_checkout_local_code
    fill_in "Phone checkout number", with: @aluno.phone_checkout_number
    fill_in "Price", with: @aluno.price
    fill_in "Prod", with: @aluno.prod
    fill_in "Prod name", with: @aluno.prod_name
    fill_in "Producer name", with: @aluno.producer_name
    fill_in "Purchase date", with: @aluno.purchase_date
    fill_in "Status", with: @aluno.status
    fill_in "Xcode", with: @aluno.xcode
    click_on "Update Aluno"

    assert_text "Aluno was successfully updated"
    click_on "Back"
  end

  test "destroying a Aluno" do
    visit alunos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aluno was successfully destroyed"
  end
end
