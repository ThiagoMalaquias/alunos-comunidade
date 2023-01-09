class AddDescriptionToAluno < ActiveRecord::Migration[6.0]
  def change
    add_column :alunos, :description, :text
  end
end
