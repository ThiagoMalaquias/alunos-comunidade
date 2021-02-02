class AddVencimentoToAluno < ActiveRecord::Migration[6.0]
  def change
    add_column :alunos, :vencimento, :string
  end
end
