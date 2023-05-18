class AddHorasToCurso < ActiveRecord::Migration[6.0]
  def change
    add_column :cursos, :horas, :string
  end
end
