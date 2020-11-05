class Aluno < ApplicationRecord
 
  def self.params_aluno(params)
    aluno = self.where(hottok: params[:hottok], email:params[:email]).first || Aluno.new
    aluno.callback_type = params[:callback_type]
    aluno.hottok = params[:hottok]
    aluno.aff = params[:aff]
    aluno.aff_name = params[:aff_name]
    aluno.currency = params[:currency]
    aluno.xcode = params[:xcode]
    aluno.payment_type = params[:payment_type]
    aluno.status = params[:status]
    aluno.prod = params[:prod]
    aluno.prod_name = params[:prod_name]
    aluno.producer_name = params[:producer_name]
    aluno.purchase_date = params[:purchase_date]
    aluno.original_offer_price = params[:original_offer_price]
    aluno.confirmation_purchase_date = params[:confirmation_purchase_date]
    aluno.cms_marketplace = params[:cms_marketplace]
    aluno.cms_vendor = params[:cms_vendor]
    aluno.price = params[:price]
    aluno.full_price = params[:full_price]
    aluno.name_subscription_plan = params[:name_subscription_plan]
    aluno.email = params[:email]
    aluno.name = params[:name]
    aluno.first_name = params[:first_name]
    aluno.last_name = params[:last_name]
    aluno.phone_checkout_local_code = params[:phone_checkout_local_code]
    aluno.phone_checkout_number = params[:phone_checkout_number]

    return aluno
  end

end
