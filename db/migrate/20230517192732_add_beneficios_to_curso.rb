class AddBeneficiosToCurso < ActiveRecord::Migration[6.0]
  def change
    execute <<-SQL
      ALTER TABLE cursos
      ADD COLUMN beneficios text[] DEFAULT '{}';
    SQL
  end
end
