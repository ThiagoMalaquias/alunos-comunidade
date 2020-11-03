class AddConfirmationPurchaseDateToAluno < ActiveRecord::Migration[6.0]
  def change
    add_column :alunos, :confirmation_purchase_date, :date
  end
end
