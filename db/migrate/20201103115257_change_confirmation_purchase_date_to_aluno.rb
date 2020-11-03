class ChangeConfirmationPurchaseDateToAluno < ActiveRecord::Migration[6.0]
  def change
    remove_column :alunos, :confirmation_purchase_date
  end
end
