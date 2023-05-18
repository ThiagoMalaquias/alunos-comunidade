class AddValorDeToCurso < ActiveRecord::Migration[6.0]
  def change
    add_column :cursos, :valor_de, :string
  end
end
