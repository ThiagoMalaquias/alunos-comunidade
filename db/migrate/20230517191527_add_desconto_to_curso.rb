class AddDescontoToCurso < ActiveRecord::Migration[6.0]
  def change
    add_column :cursos, :desconto, :string
  end
end
