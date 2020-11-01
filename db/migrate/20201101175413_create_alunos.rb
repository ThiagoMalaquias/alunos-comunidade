class CreateAlunos < ActiveRecord::Migration[6.0]
  def change
    create_table :alunos do |t|
      t.integer :callback_type
      t.string :hottok
      t.string :aff
      t.string :aff_name
      t.string :currency
      t.string :xcode
      t.string :payment_type
      t.string :status
      t.string :prod
      t.string :prod_name
      t.string :producer_name
      t.string :purchase_date
      t.string :confirmation_purchase_date
      t.string :original_offer_price
      t.float :cms_marketplace
      t.float :cms_vendor
      t.float :price
      t.float :full_price
      t.string :name_subscription_plan
      t.string :email
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :phone_checkout_local_code
      t.string :phone_checkout_number

      t.timestamps
    end
  end
end
