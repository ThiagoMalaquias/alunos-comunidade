class AddAulasToCurso < ActiveRecord::Migration[6.0]
  def change
    add_column :cursos, :aulas, :string
  end
end
