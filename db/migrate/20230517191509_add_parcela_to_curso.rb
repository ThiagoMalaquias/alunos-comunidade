class AddParcelaToCurso < ActiveRecord::Migration[6.0]
  def change
    add_column :cursos, :parcela, :string
  end
end
