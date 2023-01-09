class AddCategoryToAluno < ActiveRecord::Migration[6.0]
  def change
    add_column :alunos, :category, :string
  end
end
